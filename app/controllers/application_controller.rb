class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  helper_method :user
  def user
    session[:user]
  end
end
