class VaccinesController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @baby_vac_cal = VaccinationProgram.where(territory_id: @baby.territory).group_by(&:month)
    if session[:baby_id] == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: '¿Hablamos de bebés o de qué? anda chat@, registra uno' }
      end
    end
  end
end
