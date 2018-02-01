class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :description, :town, :address, :school1, :school2, :club1, :club2, :date_of_birth,:password, :password_confirmation, :current_password])

      # For additional in app/views/devise/registrations/edit.html.erb
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :description, :town, :address, :school1, :school2, :club1, :club2, :date_of_birth,:password, :password_confirmation, :current_password])
    end

    # Uncomment when you *really understand* Pundit!
     # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

     def user_not_authorized
       flash[:alert] = "You are not authorized to perform this action."
       redirect_to(root_path)
     end

     def default_url_options
       { host: ENV["HOST"] || "localhost:3000" }
     end


     private

     def skip_pundit?
       devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
     end

end
