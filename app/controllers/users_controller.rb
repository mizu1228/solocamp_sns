class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update_without_password
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


end
