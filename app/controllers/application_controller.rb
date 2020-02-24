class ApplicationController < ActionController::Base

  class Forbidden < StandardError; end
  private
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def login_required
    raise Forbidden unless current_user
  end
end
