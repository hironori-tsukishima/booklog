class CommentsController < ApplicationController

  before_action :set_content

  def new
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to content_path(params[:content_id]),notice:"コメントしました"
      else
        render "contents/show",alert:"ダメ！"
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :content_id).merge(user_id: current_user.id).merge(content_id: params[:content_id])
  end

  def set_content
    @content = Content.find_by(params[:content_id])
  end

end
