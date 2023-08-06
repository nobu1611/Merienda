# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    super
  end

  # POST /resource/confirmation
  def create
    super
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
  end


  protected

  # 確認指示を再送した後に使用する path
  def after_resending_confirmation_instructions_path_for(resource_name)
    super(resource_name)
  end

  # 確認後に使用する path
  def after_confirmation_path_for(resource_name, resource)
    super(resource_name, resource)
  end
end
