class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
  def require_company_owner
    if current_company.id == website.company.id
      redirect_to edit_website_path(@website)
    else
      render :edit
    end
  end
end
