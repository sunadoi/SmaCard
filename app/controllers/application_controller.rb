class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tel])
  end

  def ensure_login
    unless user_signed_in? || admin_signed_in?
      redirect_to top_cards_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_user
      user_cards_path(current_user.id)
    else
      admin_card_list_index_path(current_admin.id)
    end
  end

  def after_sign_out_path_for(resource)
    top_cards_path
  end
end
