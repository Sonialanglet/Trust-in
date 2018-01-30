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
    skip_authorization
 end

 # def destroy
 #   @profile = User.find(params[:id])
 #   authorize @profile
 #   @profile.destroy

 #   redirect_to prestations_path
 # end



  def update
    @profile = User.find(params[:id])
    @profile.update(profile_params)
    redirect_to profile_path(current_user)
  end


  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :description, :password, :town, :address, :school1, :school2, :club1, :club2)
  end
end
