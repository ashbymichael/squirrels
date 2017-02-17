class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :authorize_user, only: [:edit, :update, :delete]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user = User.find(params[:id])
      @user.update_attributes(user_params)
      flash[:success] = "#{@user.username}"
      redirect_to @user
    else
      flash[:error] = "User error"
      render :edit
    end
  end

  def destroy
    @user.delete
    log_out @user
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def set_user
    unless @user = User.find_by_id(params[:id])
      flash[:error] = "User with id #{params[:id]} does not exist"
      redirect_to root_url
    end
  end

  def authorize_user
    unless params[:id] == session[:user_id]
      flash[:error] = "You must be logged in"
      redirect_to login_url
    end
  end
end
