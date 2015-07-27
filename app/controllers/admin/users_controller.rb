class Admin::UsersController < Admin::BaseController
  before_action :is_admin?
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    redirect_to admin_users_path if User.find(params[:id]).destroy
    flash[:success] = "User is successfully removed"
  end

end