class SessionsController < ApplicationController
  layout 'plain'

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:baby_id] = @user.babies.first.id if @user.babies.exists?
      redirect_to babies_path
    else
      redirect_to new_session_path, notice: 'Datos incorrectos: revise datos de acceso o cree su usuario'
    end
  end

  def welcome
  end

  def close_session
    session[:user_id] = nil
    session[:baby_id] = nil
    log_out
    redirect_to root_path
  end
end
