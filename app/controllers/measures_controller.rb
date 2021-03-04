class MeasuresController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @height = Height.new
    @weight = Weight.new
    @height_data = Height.where(baby_id: @baby.id)
    @weight_data = Weight.where(baby_id: @baby.id)
  end
end