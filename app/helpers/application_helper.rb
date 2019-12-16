module ApplicationHelper

  def user_resource_name
    :user
  end

  def user_resource
    @resource ||= User.new
  end

  def user_devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def admin_resource_name
    :admin
  end

  def admin_resource
    @resource ||= Admin.new
  end

  def admin_devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end

end
