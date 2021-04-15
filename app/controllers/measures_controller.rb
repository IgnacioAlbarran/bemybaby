class MeasuresController < ApplicationController
  def index

    if session[:baby_id] == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: '¿Hablamos de bebés o de qué? anda, registra uno chat@'  }
      end
    end

    @baby = session[:baby_id] ? Baby.find(session[:baby_id]) : nil
    @baby_months = @baby.age_in_months
    @chart_height_data = @baby.height_percentils
    @chart_height_data[@baby.name] = @baby.height_data
    @chart_weight_data = @baby.weight_percentils
    @chart_weight_data[@baby.name] = @baby.weight_data
    @closest_max_weight = @baby.weight_percentils['Percentile 97'].find { |percentile| percentile[0] > @baby_months + 3 }[1]
    @height = Height.new
    @weight = Weight.new
    @height_data = Height.where(baby_id: @baby&.id)
    @weight_data = Weight.where(baby_id: @baby&.id)
  end
end