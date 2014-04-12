class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :save_login_state


def authenticate_user
  unless session[:user_id]
    redirect_to(:controller => 'sessions', :action => 'login')
  end
end

def save_login_state
  if session[:user_id]
    @is_logged_in = true
    @current_user = User.find session[:user_id]
  else
    @is_logged_in = false
  end
end
end
