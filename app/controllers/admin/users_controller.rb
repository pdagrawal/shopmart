class Admin::UsersController < ApplicationController
  before_action :is_admin?
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User is successfully removed"
    redirect_to admin_users_path
  end

end