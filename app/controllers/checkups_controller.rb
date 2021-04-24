class CheckupsController < ApplicationController
  before_action :set_checkup, only: [:show, :edit, :update, :destroy]

  # GET /checkups
  # GET /checkups.json
  def index
    @checkups = Checkup.all
    if session[:baby_id] == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: '¿Hablamos de bebés o de qué? anda chat@, registra uno'  }
      end
    end
  end

  # GET /checkups/1
  # GET /checkups/1.json
  def show
  end

  # GET /checkups/new
  def new
    @checkup = Checkup.new
  end

  # GET /checkups/1/edit
  def edit
  end

  # POST /checkups
  # POST /checkups.json
  def create
    @checkup = Checkup.new(checkup_params)

    respond_to do |format|
      if @checkup.save
        format.html { redirect_to @checkup, notice: 'Checkup was successfully created.' }
        format.json { render :show, status: :created, location: @checkup }
      else
        format.html { render :new }
        format.json { render json: @checkup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkups/1
  # PATCH/PUT /checkups/1.json
  def update
    respond_to do |format|
      if @checkup.update(checkup_params)
        format.html { redirect_to @checkup, notice: 'Checkup was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkup }
      else
        format.html { render :edit }
        format.json { render json: @checkup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkups/1
  # DELETE /checkups/1.json
  def destroy
    @checkup.destroy
    respond_to do |format|
      format.html { redirect_to checkups_url, notice: 'Checkup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkup
      @checkup = Checkup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkup_params
      params.require(:checkup).permit(:baby_id, :date, :notes)
    end
end
