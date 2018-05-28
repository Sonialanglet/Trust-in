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


  def registration_paramss
   params.require(:user).permit(:email, :first_name, :last_name, :photo, :facebook_picture_url, :password, :password_confirmation)
   end

end
