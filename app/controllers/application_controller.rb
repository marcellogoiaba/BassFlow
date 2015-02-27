class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  #current_user will return current logged in user in @current_user var.

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  #make current_user mthod as helper method so that View can use it.

  helper_method :current_user



end
