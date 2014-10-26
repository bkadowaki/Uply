class Api::WebsitesController < WebsitesController
  
  def show
    @website = Website.find(params[:id]) 
  end

end
