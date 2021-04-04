class ChartsController < ApplicationController
  def feeds_in_a_week
    render json: Feed.feeds_by_week_chart
  end

  def height_percentils
    Height.percentils.each do |percentile|
      render json: percentile.keys
    end
  end

  # def height_percentils
  #   Height.percentils.each do |percentile|
  #     render json: JSON.restore(percentile.to_json.gsub(/[\"]/, '')).chart_json
  #   end
  # end
end
