class LinksController < ApplicationController

  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    shortner = Shortened.new(link_params[:original_url])
    @link = shortner.generate_link

    if @link.save
        redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.join(', ')
      redirect_to links_path
    end
  end

  def link_params
    params.require(:link).permit(:original_url)
  end
end