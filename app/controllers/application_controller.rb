class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_check
  def login_check
    unless signed_in?
      flash[:alert] = "Please log in."
      redirect_to signin_path
    end
  end
end
