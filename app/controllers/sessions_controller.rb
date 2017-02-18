class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_url(user)
    else
      flash[:error] = "Username or password was incorrect"
      render :new
    end
  end

  def destroy
    if user = User.find_by_id(session[:user_id])
      log_out
      flash[:notice] = "So long, #{user.username}"
      redirect_to root_url
    else
      flash[:error] = "You somehow failed to log out"
      redirect_to user_path(user)
    end
  end
end
