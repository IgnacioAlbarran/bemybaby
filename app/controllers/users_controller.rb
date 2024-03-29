class UsersController < ApplicationController
  skip_before_action :logged_in?, only: [:new]
  skip_before_action :verify_authenticity_token, :only => :create
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'plain', only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:email)
    if !user_authorised?
      redirect_to user_path(current_user), notice: 'No tiene autorización'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:baby_id] = nil
        format.html { redirect_to new_baby_path, notice: 'Usuario creado: registra a tu bebé' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        p 'ha habido error'
        p @user.errors
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :level, :password_confirmation)
    end
end
