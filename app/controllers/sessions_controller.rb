class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    session[:user_id] = user.id
    session[:most_recent_tool_id] = user.tools.last
    redirect_to user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
