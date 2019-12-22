class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def ensure_login
    unless user_signed_in? || admin_signed_in?
      redirect_to top_cards_path
    end
  end
end
