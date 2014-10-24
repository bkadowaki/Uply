class CommentsController < ApplicationController
  
  def create
    @website         = Website.find(params[:website_id])
    @comment         = Comment.new(params.require(:comment).permit(:text))
    @comment.website = @website
    @comment.user    = current_user
    
    if @comment.save
      redirect_to website_path(@website)
    else
      render 'websites/show'
    end
  end
  
  def up
    @comment = Comment.find(params[:id])
    @up      = Up.create(upable: @comment, user_id: current_user.id)
    
    respond_to do |format|
      format.js
    end 
  end
end
