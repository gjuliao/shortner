class ClicksController < ApplicationController

    def show
        link = Link.find_by(id: @click.link_id)
        redirect_to link.original_url, allow_other_host: true
    end

    def create
        @click = Click.new(click_params)
        link = Link.find_by(id: @click.link_id)

        if @click.save
            flash[:success] = 'Click saved succesfully'
            redirect_to link.original_url, allow_other_host: true
        else
            flash[:error] = 'Click not saved'
            redirect_to links_path
        end
    end

    def clicks_per_day_data
        clicks_per_day = Click.group("DATE(created_at)").count
        data = [['Date', 'Clicks']] + clicks_per_day.map { |date, count| [date.to_s, count] }
        render json: data
      end

    private

    def click_params
        params.permit(:link_id)
    end
end
