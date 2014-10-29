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

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   @comment = Comment.find(paramd[:id])
  #   if @comment.update_attributes(params.require(:comment).permit(:text))
  #   redirect_to websites_path(@website)
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user
      @comment.destroy
      redirect_to :back 
    else  
      render 'website/show'
    end
   end

end
