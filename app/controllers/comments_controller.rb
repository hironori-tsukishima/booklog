class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to content_path(@content),notice:"コメントしました"
      else
        render 'contents/show',flash.now[:alert] = "コメントできませんでした"
      end
  end

  private
  def comment_params
    params.permit(:text, :tweet_id).merge(user_id: current_user.id)
  end


end
