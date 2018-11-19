class ContentsController < ApplicationController

  def index
    @contents = Content.order("created_at ASC")
  end

  def new
  end

  def create
    @content = Content.new
      if @content.save
        redirect_to contents_path
      else
        render new_content_path
      end
  end

  def content_params
    params.require(:content).permit(:image, :text, :title, :summary,)
  end

end



