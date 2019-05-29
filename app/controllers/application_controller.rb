class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  # protect_from_forgery with: :exception
  protect_from_forgery except: :create
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!

  # def after_sign_out_path_for(resource)
  #   root_path # ログアウト後に遷移するpathを設定
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
