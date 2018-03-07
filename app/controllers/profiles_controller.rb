class ProfilesController < ApplicationController

 def index
   policy_scope(Profile)
   @profiles = Profile.all
 end

  def show
  @profile = User.where({user_id: current_user.id})
  authorize @user
  @prestations = Prestation.where({user_id: current_user.id})


  end


 def new
   @profile = Profile.new
   authorize @profile


 end

 def create
   @profile = Profile.new(profile_params)
   @profile.user = current_user


   authorize @profile
   if @profile.save
     redirect_to profile_path(@profile)
   else
     render :new
   end
 end


 def edit
  @profile = Profile.find(params[:id])
  authorize @profile
 end

 # def destroy
 #   @profile = User.find(params[:id])
 #   authorize @profile
 #   @profile.destroy

 #   redirect_to prestations_path
 # end


  def update
    @profile = User.where({user_id: current_user.id})
    @profile.update(profile_params)
    redirect_to profile_path(current_user)
  end


  private

  def profile_params
    params.require(:profile).permit(:description, :town, :address, :school1, :school2, :club1, :club2, :date_of_birth)
  end
end
