class MyDevise::RegistrationsController < Devise::RegistrationsController

  def create
    super
    @role = Role.create(role_name: "Customer", user_id: resource.id)
  end

end