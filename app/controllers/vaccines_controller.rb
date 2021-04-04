class VaccinesController < ApplicationController
  def index
    if session[:baby_id] == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: '¿Hablamos de bebés o de qué? anda chat@, registra uno' }
      end
    end
  end
end
