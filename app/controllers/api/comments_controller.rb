class Api::CommentsController < ApplicationController
  def top
    @comment = Comment.all.sort_by(&:comment_score).reverse.first
  end
end
