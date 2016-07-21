class ApplicationController < ActionController::Base
  helper_method :most_recent_tool, :current_tool_count, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_tool
    @most_recent_tool ||= Tool.find(session[:most_recent_tool_id]) if session[:most_recent_tool_id]
  end

  def current_tool_count
    @current_tool_count = session[:current_tool_count]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

end
