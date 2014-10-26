class Api::WebsitesController < WebsitesController
  
  def show
    @website = Website.all 
    id = params[:id].to_i
    response = { 'title' => @website.where("id = '#{id }'") }
    
    respond_to do |format|
      format.json { render :json => response }
    end   
  end

end
