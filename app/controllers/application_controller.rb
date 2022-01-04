class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_google_calender

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def set_google_calender
    gon.google_calender_API_key = ENV['GOOGLE_CALENDER_API_KEY']
  end
  
end
