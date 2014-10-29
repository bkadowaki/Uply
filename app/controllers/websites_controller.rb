class WebsitesController < ApplicationController
  before_action :set_website, only:[:show, :edit, :update, :up]

  def index
    @websites = Website.all
  end
  
  def new
    @website = Website.new
  end
  
  def create
    @website = Website.new(website_params)
    
    @website.favicon       = @website.scrape_favicon
    @website.title         = @website.scrape_title unless @website.title.is_a? String
    @website.description   = @website.scrape_description unless @website.description.is_a? String
    @website.category_ids << @website.generate_category unless @website.category_ids.select{ |i| i.class == Fixnum }.count != @website.category_ids.count
     
    if @website.save
      @website.generate_screenshot
      redirect_to website_path(@website)
    else
      render :new
    end
  end
  
  def show
    @comment = Comment.new
    gon.websiteId = @website.id
  end
  
  def edit; end
 
  def d3
    render layout: false
  end
  
  def update
    if @website.update_attributes(website_params)
      redirect_to website_path(@website)
    else
      render :edit
    end
  end
  
  def destroy
    if current_company == @website.company
      @website.destroy
      redirect_to company_path(current_company)
    else
      render 'company/show'
    end
  end
  
  def up
    @up = Up.create(upable: @website, user_id: current_user.id)
    
    respond_to do |format|
      format.js
    end 
  end
   
  def search
    # "I" is for ignoring uppercase and lower case difference.
    # LIKE = looking for the stuff that is closest to the keyword
    # "%# contentgoeshere %" = prevents direct injection of the words typed in the search box into our database (postgreSQL specific)
    @results = Website.where("url ILIKE ?", "%#{params[:keyword]}%")
  end


  private
  
  def set_website
    @website = Website.find(params[:id]) 
  end
  
  def website_params
    params.require(:website).permit(:title, :url, :description, :favicon, :screenshot, category_ids: [])
  end
end
