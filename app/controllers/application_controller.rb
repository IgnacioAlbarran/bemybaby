class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :logged_in?
  helper_method :current_user
  helper_method :logged_in?

  # views_without_menu = {
  #   initial_view: params[:controller] == xxx and params[:action] == xxx,
  #   log_in_view: params[:controller] == xxx and params[:action] == xxx,
  #   sign_in_view: params[:controller] == xxx and params[:action] == xxx,
  # }

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_baby
    Baby.find_by(id: session[:baby_id])
  end

  def logged_in?
    redirect_to root_path unless current_user
  end

  def user_authorised?
    nil unless current_user
    if params[:controller] == 'users' && params[:action] == 'index'
      current_user.level >= 4
    end
    #igualmente podemos crear un hash para cada controller y sus keys serán las acciones, que el valor
    # será el mínimo exigido de nivel para acceder
    #después en este mismo método, le indicaremos que salte error si  params[:controller][params[:action]] > current_user.level
  end

  def log_out
    session[:user_id] = nil
    session[:baby_id] = nil
  end

  def baby_to_session(baby_id)
    session[:baby_id] = baby_id
  end
end
