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

  def edit
    @content = Content.find(params[:id])
  end

private

  def content_params
    params.require(:content).permit(:text, :title, :summary)
  end
end



