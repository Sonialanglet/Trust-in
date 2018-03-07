class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
   resource.update_without_password(params)
  end

  # def after_sign_up_path_for(resource)
  #   super(resource)
  #   group=Group.new(title: "carnet d'adresse de #{resource.email}", founder: resource)
  #   group.users << resource
  #   group.save
  #end
end
