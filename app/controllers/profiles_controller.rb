class ProfilesController < ApplicationController
  def show
  @profile = User.find(params[:id])
  # @prestations = Prestation.where({user_id: current_user.id})

  end
end
