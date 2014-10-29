class Website < ActiveRecord::Base
  include ApplicationHelper
  require 'date'
  before_save :default_values
  
  validates_uniqueness_of :url
  validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\Z/ix, message: 'URL needs to be valid'}
  
  belongs_to :company
  has_many :comments
  has_many :website_categories
  has_many :categories, through: :website_categories
  has_many :ups, as: :upable

  has_attached_file :screenshot, 
                    :styles => {
                      :medium => "250x",
                      :large => "400x"
                    },
                    :storage => :s3,
                    :s3_credentials => {
                      :bucket => ENV['S3_BUCKET_NAME'],
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }
  validates_attachment :screenshot, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
 
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def default_values
    if self.categories.length == 0
      self.categories << Category.where("name = 'All Sites'")
    end
  end

  ### Determine the score of a website, based off of the 'ups' and amount of time
  ### since the website was created. This will be used for populating the 'TRENDING' tab
  ### This Gravity/Time Algorithm was adopted from the Hacker News front page algorithm 
  ### https://news.ycombinator.com/

  def website_score
    c = DateTime.parse(self.created_at.to_datetime.to_s)
    t = (DateTime.now - c).to_i
    p = self.ups.count
    
    (p-1)/((t+2)**(1.8))
  end

  ### Determine the score of comments "Most discussed" based on the gravity/time algorithm
  ### being used for the score of the website, but with a heavier gravity, so that the most
  ### discussed with change frequently
  
  def website_comment_score
    c = DateTime.parse(self.created_at.to_datetime.to_s)
    t = (DateTime.now - c).to_i
    p = self.comments.count
  
    (p)/((t+2)**(0.8))
  end

  #################################################################
  # the following methods are executed when a website is created
  # without a title, desc, or category. If not matches are found for 
  # any of them, return nil and creation of website profile will halt.

  ### Check if the URL is valid  
  def checkURL
    !!(self.url =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
  end

  ### Scrape the url for the title
  def scrape_title
    if self.checkURL
      mechanize = Mechanize.new
      page = mechanize.get(self.url)
      page.title ? page.title : nil
    else
      self.url.gsub('http://', '').gsub('https://', '')
    end
  end

  ### Scrape the url for the meta description
  def scrape_description
    if self.checkURL
      mechanize = Mechanize.new
      page = mechanize.get(self.url)
    
      if page.at("head meta[name='description']")
        page.at("head meta[name='description']").attributes["content"].value   
      elsif page.at("head meta[name='Description']")
        page.at("head meta[name='Description']").attributes["content"].value
      else
        "No Description"
      end
    else
      "No Description"
    end
  end

  ### Using the title and meta description that were scraped, compare those words to
  ### the default categories that Alexa provide on their site, if there is a match
  ### then return that category, otherwise return "Uncategorized"
  def categorize_website
    category = "All"
    if self.checkURL
      website_keywords = self.scrape_title + " " + self.scrape_description  
      website_keywords = website_keywords.delete(',').gsub('the', '').gsub('on', '').gsub('and', '').gsub('more','')
      bad_words = "porn pornstar pornstars nude shemales webcam webcams sex sexshow erotic gay kinky fetish bondage swingers hookups hookup playboy playmate" 
      categories = get_categories

      website_keywords.split(" ").each do |keyword|
        category = (categories.include? keyword)  ? (categories.split(" ").detect{ |word| word.include? keyword }) : category
        if category != "All"
          break
        end
      end
      
      if category != "adult"
        bad_words.split(" ").each do |flag|
          if website_keywords.include? flag
            return category = "adult"
          end 
        end
      end
      category
    else
      category
    end   
  end
  
  ### Using the category match from categorize_website method, find and return the category id 
  def generate_category
    if self.checkURL
      category_name = self.categorize_website.capitalize
      category = Category.where("name = '#{category_name}'").first
      category.id
    end
  end
  
  ### Scrape the favicon of each website and save it to the database for display uses. MetaInspector
  ### will only search the meta tags for favicons, if no icon is found, a default one will be provided.
  
  def scrape_favicon
    if self.checkURL
      page = MetaInspector.new(self.url)
      if page.favicon
        page.favicon
      else
        "https://lh3.googleusercontent.com/-T4Hy85789og/UFNUt29AJxI/AAAAAAAA0DI/UzV2M6LgeY0/s288/ui_resources_default_200_percent_default_favicon_new.png"
      end
    end
  end
  
  ### Using ImgKit, this will pull in the html of the front page and save a jpg image of the page to aws
  
  def generate_screenshot
    img = IMGKit.new(self.url).to_jpg
    file  = Tempfile.new(["template_#{self.id}", 'jpg'], 'tmp',
                         :encoding => 'ascii-8bit')
    file.write(img)
    file.flush
    self.screenshot = file
    self.save
    file.unlink 
  end
end
