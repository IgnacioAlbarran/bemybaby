class MeasuresController < ApplicationController
  def index
    if session[:baby_id] == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: '¿Hablamos de bebés o de qué? anda, registra uno chat@'  }
      end
    end

    @baby = session[:baby_id] ? Baby.find(session[:baby_id]) : nil
    @height = Height.new
    @weight = Weight.new
    @height_data = Height.where(baby_id: @baby&.id)
    @weight_data = Weight.where(baby_id: @baby&.id)
  end
end