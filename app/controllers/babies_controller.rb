class BabiesController < ApplicationController
  before_action :set_baby, only: [:show, :edit, :update, :destroy]

  # GET /babies
  # GET /babies.json
  def index
    @babies = Baby.where(user_id: params[:user_id])
    if @babies.nil?
      render new_user_baby_path
    end
  end

  # GET /babies/1
  # GET /babies/1.json
  def show
  end

  # GET /babies/new
  def new
    @user = User.find(params[:user_id])
    @baby = Baby.new
  end

  # GET /babies/1/edit
  def edit
  end

  # POST /babies
  # POST /babies.json
  def create
    @baby = Baby.new(baby_params)
    @baby[:user_id] = session[:user_id]

    respond_to do |format|
      if @baby.save
        format.html { redirect_to user_baby_path(@baby.user_id, @baby.id), notice: 'Baby was successfully created.' }
        format.json { render :show, status: :created, location: @baby }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /babies/1
  # PATCH/PUT /babies/1.json
  def update
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @user.babies.find(@baby.id).update(baby_params)
        format.html { redirect_to user_baby_path(@baby.user_id, @baby.id), notice: 'Baby was successfully updated.' }
        format.json { render :show, status: :ok, location: @baby }
      else
        format.html { render :edit }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /babies/1
  # DELETE /babies/1.json
  def destroy
    @user = User.find(params[:user_id])
    @user.babies.find(@baby.id).destroy
    respond_to do |format|
      format.html { redirect_to user_babies_path, notice: 'Baby was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_baby
    @baby = Baby.find(params[:baby_id])
    session[:baby_id] = params[:baby_id]
    redirect_to user_baby_path(@baby.user.id, @baby.id), notice: "Bebe seleccionado: #{@baby.name}"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baby
      @baby = Baby.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def baby_params
      params.require(:baby).permit(:name, :last_name, :dob, :gender, :blood_type, :user_id)
    end
end
