class RegistrationsController < Devise::RegistrationsController
  def create
    super
    Role.create(role_name: "Customer", user_id: resource.id)
    resource.create_activity :create, owner: resource
  end

  def update
    super
    resource.create_activity :update, owner: resource
  end

  def destroy
    resource.create_activity :destroy, owner: resource
    super
  end
end