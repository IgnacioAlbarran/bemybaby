class HeightsController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @height_data = @baby.heights
  end

  # GET /height/new
  def new
  end

  def edit
  end

  def create
    @height = Height.new(height_params)
    @height.baby_id = session[:baby_id]

    respond_to do |format|
      if @height.save
        format.html{ redirect_to measures_path, notice: 'height was successfully created.' }
      else
        format.html { render :new, notice: @height.errors.full_messages }
      end
    end
  end

  def update
    respond_to do |format|
      if @height.update(height_params)
        format.html { redirect_to measures_path, notice: 'Height was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def height_params
    params.require(:height).permit(:height, :date)
  end
end
