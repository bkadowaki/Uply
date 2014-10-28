class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def show
		@company = Company.find(params[:id])
		@comments = Comment.all
    gon.companyId = @company.id
	end
  
  def d3
    render layout: false
  end

end
