class LinksController < ApplicationController

  def show
    link = Link.find_by(short_url: params[:short_url])
    redirect_to link.original_url, allow_other_host: true
  end

  def index
    @links = Link.all
    @link = Link.new
    @browser = Browser.new(request.env["HTTP_USER_AGENT"])
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
