class SessionsController < ApplicationController
  layout 'plain'

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:baby_id] = @user.babies.first.id if @user.babies.exists?
      redirect_to user_babies_path(@user.id)
    else
      redirect_to new_session_path, notice: 'Datos incorrectos: revise datos de acceso o cree su usuario'
    end
  end

  def welcome
  end

  def close_session
    log_out
    redirect_to root_path
  end
end
