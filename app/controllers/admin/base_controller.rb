class Admin::BaseController < ApplicationController
  before_action :require_user_login
  
  def is_admin?
    User.find(current_user.id).roles.each do |role|
      return true if role.role_name == "Admin"
    end
    flash[:danger] = "You must have admin authorities to access this section"
    redirect_to root_path
  end
end