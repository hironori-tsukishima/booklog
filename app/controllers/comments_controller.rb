class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(commnent_params)
  end

  private
  def comment_params
    params.permit(:text, :tweet_id).merge(user_id: current_user.id))
  end
end
