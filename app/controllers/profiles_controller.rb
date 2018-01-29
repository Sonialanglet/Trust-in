class ProfilesController < ApplicationController

 # def index

 # if params[:query].present?
 #   sql_query = "last_name ILIKE :query OR first_name ILIKE :query"
 #   @profiles = User.where(sql_query, query: "%#{params[:query]}%")
 #  else
 #   @profiles = User.all
 #  end
 # end

  def show
  @profile = User.find(params[:id])
  skip_authorization

  end


 def edit
   @profile = User.find(params[:id])
   authorize@profile
 end

 def destroy
   @profile = User.find(params[:id])
   authorize @profile
   @profile.destroy

   redirect_to prestations_path
 end



 def update
   @profile = User.find(params[:id])
   @profile.update(params[:profile])
   redirect_to profile_path(@profile)
 end

 private

 def profile_params
   params.require(:profile).permit(:email, :photo, :first_name, :last_name, :description, :town, :address, :school1, :school2, :club1, :club2, :birth_date)

 end
end
