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
    # @prestation = Prestation.find(params[:id])
    # # authorize @prestation
    # @bookings = @prestation.bookings
    # @bookings.each do |booking|
    #   booking.destroy
    # end
    # @prestation.destroy

    # redirect_to prestations_path
  end

  def edit
  end

  def update
  end

  private

  def prestation_params
    params.require(:prestation).permit(:price, :description, :category)
  end

end
