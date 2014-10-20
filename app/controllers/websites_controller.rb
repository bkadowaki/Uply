class WebsitesController < ApplicationController
  before_action :set_website, only:[:show, :edit, :update]

  def index
    @websites = Website.all
  end
  
  def new
    @website = Website.new
  end
  
  def create
    @website = Website.new(website_params)
    
    @website.title         = scrape_title(@website.url) unless @website.title.is_a? String
    @website.description   = scrape_description(@website.url) unless @website.description.is_a? String
    @website.category_ids << generate_category(@website.url) unless @website.category_ids.select{ |i| i.class == Fixnum }.count != @website.category_ids.count
     
    if @website.save
      redirect_to website_path(@website)
    else
      render :new
    end
  end
  
  def show; end
  
  def edit; end
  
  def update
    if @website.update_attributes(website_params)
      redirect_to website_path(@website)
    else
      render :edit
    end
  end
   
  private
  
  def set_website
    @website = Website.find(params[:id]) 
  end
  
  def website_params
    params.require(:website).permit(:title, :url, :description, category_ids: [])
  end
  
  def scrape_title(url)
    if checkURL(url)
      mechanize = Mechanize.new
      page = mechanize.get(url)
      page.title ? page.title : nil
    else
      nil
    end
  end
  
  def scrape_description(url)
    if checkURL(url)
      mechanize = Mechanize.new
      page = mechanize.get(url)
    
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
  
  def categorize_website(url)
      category = "Uncategorized"
    if checkURL(url)
      website_keywords = scrape_title(url) + " " + scrape_description(url)   
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
  
  def generate_category(url)
    if checkURL(url)
      category_name = categorize_website(url).capitalize
      category = Category.where("name = '#{category_name}'").first
      category.id
    end
  end
end
