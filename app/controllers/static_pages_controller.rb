class StaticPagesController < ApplicationController
	
  def index;end
  
  def logo
    render layout: false
  end
end
