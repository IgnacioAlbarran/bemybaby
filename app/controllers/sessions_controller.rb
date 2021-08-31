class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create, :test_point, :welcome]

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

  def test_point
    UserMailer.welcome_email('ignacioalbarran851@gmail.com').deliver_now
  end

  def close_session
    session[:user_id] = nil
    session[:baby_id] = nil
    log_out
    redirect_to root_path
  end
end
