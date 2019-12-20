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

  require 'chunky_png'

  def qrcode_tag(text, options = {})
    qr = ::RQRCode::QRCode.new(text)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
  end

end
