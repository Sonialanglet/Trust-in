class ProfilesController < ApplicationController

def index
 policy_scope(Profile)
 @profiles = Profile.all
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
   @profile = Profile.find(params[:id])
    authorize @profile
 end

 def edit2
   @profile = current_user.profile
    authorize @profile
 end



  def update

   # @profile = current_user.profile
   @profile = Profile.find(params[:id])

    @profile.update(profile_params)
    authorize @profile
    redirect_to profile_path(@profile)
  end

 # def destroy
 #   @profile = User.find(params[:id])
 #   authorize @profile
 #   @profile.destroy

 #   redirect_to prestations_path
 # end

 def profile_params
   params.require(:profile).permit(:description, :date_of_birth, :town, :adress, :school1, :school2, :club1, :club2, :phone)
 end


end

