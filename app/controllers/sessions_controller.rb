# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :login_check, only: %i[new create]
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user.authenticate(params[:password])
      sign_in @user
      redirect_to attendances_new_path
    else
      redirect_to signin_path, flash: { error: 'メールアドレスとパスワードが一致しません' }
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  def action
    user_id = params[:id]
    posts = User.fetch_post(user_id)
    render posts
  end
end
