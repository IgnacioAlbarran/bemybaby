class WeightsController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @weight_data = @baby.weights
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.baby_id = session[:baby_id]

    respond_to do |format|
      if @weight.save
        format.html { redirect_to measures_path, notice: 'weight was successfully created.' }
      else
        p @weight.errors.full_messages
        format.html { render :new, notice: @weight.errors.full_messages}
      end
    end
  end

  def update
  end

  def delete
  end

  private

  def weight_params
    params.require(:weight).permit(:weight, :date)
  end
end
