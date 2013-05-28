class ApplicationController < ActionController::Base
  protect_from_forgery
   # $category = Category.all
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end


end