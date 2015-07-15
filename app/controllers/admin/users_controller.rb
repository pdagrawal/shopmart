class Admin::UsersController < ApplicationController
  before_action :require_admin_login
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User is successfully removed"
    redirect_to admin_users_path
  end

  private
  def require_admin_login
    if user_signed_in?
      is_admin
    else
      redirect_to new_user_session_path
    end
  end
end