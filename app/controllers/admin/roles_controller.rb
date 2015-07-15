class Admin::RolesController < ApplicationController

  def add_admin_role
    @user = User.find(params[:id])
    @role = Role.create(role_name: "Admin")
    @role.user_id = @user.id
    @role.save
    redirect_to admin_users_path
  end

  def remove_admin_role
    @user = User.find(params[:id])
    binding.pry
  	@role = @user.roles.where(role_name: "Admin").first
    @role.destroy
    redirect_to admin_users_path
  end
end