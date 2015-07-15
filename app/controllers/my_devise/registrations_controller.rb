class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super
    @role = Role.create(role_name: "Customer")
    @role.user_id = resource.id
    @role.save
  end

end