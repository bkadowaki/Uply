class Api::WebsitesController < WebsitesController
  
  def index
    @websites = Website.all
  end
  
  def show
    @website = Website.all 
    id = params[:id].to_i
    response = { 'title' => @website.where("id = '#{id }'") }
    
    respond_to do |format|
      format.json { render :json => response }
    end   
  end
  
  def comscore
    @website = Website.all.sort_by(&:website_comment_score).reverse.first
    
  end

end
