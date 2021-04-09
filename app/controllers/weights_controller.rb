class WeightsController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @weight_data = @baby.weights
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.baby_id = session[:baby_id]
    @baby = Baby.find(session[:baby_id])

    respond_to do |format|
      if @weight.save
        format.js{ render 'measures/refresh_weights', notice: 'weight was successfully created.' }
        # format.html{ redirect_to measures_path, notice: 'weight was successfully created.' }

      else
        format.html { render :new, notice: @weight.errors.full_messages }
      end
    end
  end

  def update
  end

  def destroy
    @baby = Baby.find(session[:baby_id])
    respond_to do |format|
      if Weight.find(params[:id]).delete
        format.js{ render 'measures/refresh_weights', notice: 'Peso borrado' }
      else
        format.html { render measures_path, notice: @weight.errors.full_messages }
      end
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:weight, :date, :id)
  end
end
