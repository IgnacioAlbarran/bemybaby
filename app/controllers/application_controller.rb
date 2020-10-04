class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  helper_method :current_user
  helper_method :logged_in?

  # views_without_menu = {
  #   initial_view: params[:controller] == xxx and params[:action] == xxx,
  #   log_in_view: params[:controller] == xxx and params[:action] == xxx,
  #   sign_in_view: params[:controller] == xxx and params[:action] == xxx,
  # }

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    session[:baby_id] = nil
  end

  def baby_to_session(baby_id)
    session[:baby_id] = baby_id
  end
end
