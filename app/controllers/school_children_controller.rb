class SchoolChildrenController < ApplicationController


  def index
    policy_scope(SchoolChild)


        @school_children = SchoolChild.near(params[:latitude => current_user.profile.latitude, :longitude => current_user.profile.longitude], 20, units: :km, :order => :distance)

  end

  def show
    @school_child = SchoolChild.find(params[:id])
    authorize @school_child

  end

end
