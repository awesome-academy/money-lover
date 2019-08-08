class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :require_login

  def set_locale
    if params[:locale].present?
      set_param_locale params[:locale]
    end  
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "flash.please_log"
    redirect_to login_url
  end

  def format_number number
    number.to_s.gsub(/,/,'').to_f
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
