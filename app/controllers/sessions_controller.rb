class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      puts user,"session created!"
    else
      render 'new'
    end
  end

  def destroy

  end
end
