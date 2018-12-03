class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :first_time_visit, unless: -> {cookies[:first_visit]}


    # Pundit: white-list approach.
    after_action :verify_authorized, except: [:index, :recomanded_prestations], unless: :skip_pundit?
    after_action :verify_policy_scoped, only: [:index, :recomanded_prestations], unless: :skip_pundit?

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :description, :town, :address, :school1, :school2, :club1, :club2, :date_of_birth,:password, :password_confirmation, :current_password, :agreement, :newsletter])

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


     def first_time_visit
      if cookies[:first_visit] != "1"
          cookies.permanent[:first_visit] = 1
          cookies[:first_session] = 1
          @first_visit = true
      else
          if !cookies[:first_session].blank?
            @first_visit = true
          else
            @first_visit = false
          end
      end

     end

     private

     def skip_pundit?
       devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
     end

end
