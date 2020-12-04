class ChartsController < ApplicationController
  def feeds_in_a_week
    byebug
    render json: Feed.feeds_by_week_chart
  end
end

