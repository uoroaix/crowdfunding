class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  after_action :set_access_controller_headers


  private

  def set_access_controller_headers
    headers['Access-Control-Allow-Origin']   = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    redirect_to root_path, alert: "You Need To Sign In" if current_user.nil?
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end
  
end
