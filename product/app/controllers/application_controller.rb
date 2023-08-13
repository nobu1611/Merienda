class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) # 新規登録時にusernameを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:username]) # ユーザー情報編集時にusernameを許可
  end
end
