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
        redirect_to contents_path
      else
        render :new
      end
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
      if content.user_id == current_user.id
          content.update(content_params)
            redirect_to content_path
      else
        render :index
      end
  end

  def destroy
    content = Content.find(params[:id])
      if content.user_id == current_user.id
        content.destroy
          redirect_to contents_path
      else
        render :show
      end
  end

private
  def content_params
    params.require(:content).permit(:text, :title, :summary).merge(user_id: current_user.id)
  end
end



