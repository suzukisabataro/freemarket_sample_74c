class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :parents_where

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_yy, :birth_mm, :birth_dd, :first_name, :family_name, :first_name_kana, :family_name_kana, :phone_number])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def parents_where
    @parents = Category.where(ancestry: nil).limit(13)
  end
end
