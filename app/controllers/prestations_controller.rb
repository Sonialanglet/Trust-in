class PrestationsController < ApplicationController
  def index
    policy_scope(Prestation)
    @prestations = Prestation.all
  end

  def show
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    # @booking = Booking.new
  end

  def new
    @prestation = Prestation.new
    authorize @prestation
  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.user = current_user
    authorize @prestation
    if @prestation.save
      redirect_to prestation_path(@prestation)
    else
      render :new
    end
  end

  def destroy
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    @prestation.destroy

    redirect_to prestations_path
  end

  def edit
    @prestation = Prestation.find(params[:id])
    authorize @prestation
  end

  def update
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    @prestation.update(prestation_params)
    redirect_to prestation_path(current_user)
  end

  private

  def prestation_params
    params.require(:prestation).permit(:price, :description, :category, :photo, :service_ids)
  end

end
