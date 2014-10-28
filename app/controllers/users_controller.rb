class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@comments = Comment.all
    gon.userId = @user.id
	end
  
  def d3
    render layout: false
  end

end
