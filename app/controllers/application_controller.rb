class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  stale_when_importmap_changes

  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :username, :gender])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
