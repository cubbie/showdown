class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user #Finds the current user if it exists
    if User.all.count > 0
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  helper_method :current_user #Allows the method to be called anywhere
end
