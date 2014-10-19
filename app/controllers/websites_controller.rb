class WebsitesController < ApplicationController

  def index
    @websites = Website.all
  end
  
  def new
    @website = Website.new
  end
  
  def create
    @website = Website.new(params.require(:website).permit!)
    
    @website.title = scrape_title(@website.url) unless @website.title.is_a? String
    @website.description = scrape_description(@website.url) unless @website.description.is_a? String
    @website.category_id = generate_category(@website.url) unless @website.category_id.is_a? Integer
     
    if @website.save
      redirect_to website_path(@website)
    else
      render :new
    end
  end
  
  def show
    @website = Website.find(params[:id])
  end
  
  def edit
    @website = Website.find(params[:id])
  end
  
  def update
  end
  
  private
  
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
    if checkURL(url)
      category = "uncategorized"
      website_keywords = scrape_title(url) + " " + scrape_description(url)   
      website_keywords = website_keywords.delete(',').gsub('the', '').gsub('on', '').gsub('and', '').gsub('more','')
      bad_words = "porn pornstar pornstars nude shemales webcam webcams sex sexshow erotic gay kinky fetish bondage swingers hookups hookup playboy playmate" 
      categories = get_categories 
      
      website_keywords.split(" ").each do |keyword|
        category = (categories.include? keyword)  ? (categories.split(" ").detect{ |word| word.include? keyword }) : category
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
      nil
    end   
  end
  
  def generate_category(url)
    if checkURL(url)
      category_name = categorize_website(url)
      category = Category.where("name = 'category_name'").first
      category.id
    end
  end

end
