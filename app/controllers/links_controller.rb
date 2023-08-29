class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def create
    shortner = Shortner.new(link_params[:original_url])
    @link = shortner.generate_link
  end

  def link_params
    params.require(:link).permit(:original_url)
  end
end
