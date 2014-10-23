class Website < ActiveRecord::Base
  include ApplicationHelper
  
  validates_uniqueness_of :url
  validates_presence_of :title
  validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\Z/ix, message: 'URL needs to be valid'}
  
  belongs_to :company
  has_many :comments
  has_many :website_categories
  has_many :categories, through: :website_categories
  has_many :ups


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
      nil
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
        nil
      end
    else
      nil
    end
  end

### Using the title and meta description that were scraped, compare those words to
### the default categories that Alexa provide on their site, if there is a match
### then return that category, otherwise return "Uncategorized"
  def categorize_website
    category = "Uncategorized"
    if self.checkURL
      website_keywords = self.scrape_title + " " + self.scrape_description  
      website_keywords = website_keywords.delete(',').gsub('the', '').gsub('on', '').gsub('and', '').gsub('more','')
      bad_words = "porn pornstar pornstars nude shemales webcam webcams sex sexshow erotic gay kinky fetish bondage swingers hookups hookup playboy playmate" 
      categories = get_categories

      website_keywords.split(" ").each do |keyword|
        category = (categories.include? keyword)  ? (categories.split(" ").detect{ |word| word.include? keyword }) : category
        if category != "Uncategorized"
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
end
