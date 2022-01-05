# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_check
  def login_check
    return if signed_in?

    flash[:alert] = 'Please log in.'
    redirect_to signin_path
  end
end
