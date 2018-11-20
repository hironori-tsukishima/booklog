class ContentsController < ApplicationController

  def index
    @contents = Content.order("created_at ASC")
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
      if @content.save
        redirect_to contents_path, notice:"保存しました！"
      else
        render :new,flash.now[:alert] = "保存できていません。タイトルは入れてくださいね"
      end
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
      if content.user_id == current_user.id
          content.update(content_params)
            redirect_to content_path, notice:"変更を保存しました"
      else
        render :index,flash.now[:alert] = "変更は保存できていません、、。"
      end
  end

  def destroy
    content = Content.find(params[:id])
      if content.user_id == current_user.id
        content.destroy
          redirect_to contents_path,notice:"削除しました"
      else
        render :show,flash.now[:alert] = "削除できませんでした"
      end
  end

private
  def content_params
    params.require(:content).permit(:text, :title, :summary).merge(user_id: current_user.id)
  end
end



