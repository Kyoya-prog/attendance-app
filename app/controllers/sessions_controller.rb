class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
