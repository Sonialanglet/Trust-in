class ProfilesController < ApplicationController

def index
 policy_scope(Profile)

 @profiles = Profile.where.not(latitude: nil, longitude: nil)

    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
end


  def show

   @profile = Profile.find(params[:id])


    skip_authorization
    @prestations = Prestation.where({user_id: @profile.user.id})

  end

#   def new
#     @profile = Profile.new
#     authorize @profile
#   end

# def create
# @profile = Profile.new(profile_params)
# @profile.user = current_user


# authorize @profile
# if @profile.save
# redirect_to profile_path(@profile)
# else
# render :new
# end
# end


 def edit
   @profile = current_user.profile
    authorize @profile
 end

 def edit2
   @profile = current_user.profile
    authorize @profile
 end



  def update

   # @profile = current_user.profile
   @profile = Profile.find(params[:id])

    authorize @profile
    if  URI(request.referer).path == "/profiles/#{current_user.id}/edit2"
     if profile_params[:adress].empty?
        flash[:error] = 'Adresse obligatoire'
        redirect_to edit2_profile_path(@profile)
      else
        @profile.update(profile_params)
        redirect_to groups_path
      end
    else
      if profile_params[:adress].empty?
        flash[:error] = 'Adresse obligatoire'
        redirect_to edit_profile_path(@profile)
      else
        @profile.update(profile_params)
        redirect_to profile_path(@profile)
      end
    end
  end

 # def destroy
 #   @profile = User.find(params[:id])
 #   authorize @profile
 #   @profile.destroy

 #   redirect_to prestations_path
 # end

 def profile_params
   params.require(:profile).permit(:description, :date_of_birth, :town, :adress, :school1, :school2, :formation1, :formation2, :phone, :child_school1, :child_school2)
end


end

