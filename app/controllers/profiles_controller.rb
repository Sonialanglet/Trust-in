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
end
