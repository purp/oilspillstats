class SessionsController < ApplicationController
  def signin
  end

  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    redirect_to admin_events_path
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to signin_path
  end
end
