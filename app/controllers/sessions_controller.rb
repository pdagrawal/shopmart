class SessionsController < Devise::SessionsController
  def create
    super
    resource.create_activity :login, owner: resource
  end

  def destroy
    current_user.create_activity :logout, owner: current_user
    super
  end
end