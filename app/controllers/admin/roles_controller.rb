class Admin::RolesController < Admin::BaseController
	before_action :is_admin?
  def add_admin_role
    redirect_to admin_users_path if Role.create(role_name: "Admin", user_id: params[:id])
  end

  def remove_admin_role
    redirect_to admin_users_path if User.find(params[:id]).roles.where(role_name: "Admin").first.destroy
  end
end