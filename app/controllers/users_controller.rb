class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :authenticate, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def remove_wine
    @user = current_user
    @user.wines.find(params[:id]).destroy
    redirect_to user_path(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to (user_path(@user))
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:current_user] = nil
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :address, :birthday,
    :preference, :password, :password_confirmation)
  end
end
