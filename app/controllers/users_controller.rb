# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :login_check
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to attendances_new_path
    else
      redirect_to signup_path ,flash: { error: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
