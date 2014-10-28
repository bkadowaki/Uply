class Api::WebsitesController < WebsitesController
  
  def index
    @websites = Website.all
  end
  
  def show
    @website = Website.find(params[:id]) 
  end
  
  def comscore
    @website = Website.all.sort_by(&:website_comment_score).reverse.first
    
  end

end
