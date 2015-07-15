class Admin::RolesController < ApplicationController

  def add_admin_role
    @role = Role.create(role_name: "Admin", user_id: params[:id])
    @role.save
    redirect_to admin_users_path
  end

  def remove_admin_role
    User.find(params[:id]).roles.where(role_name: "Admin").first.destroy
    redirect_to admin_users_path
  end
end