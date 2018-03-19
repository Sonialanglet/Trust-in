class BookingsController < ApplicationController


  def index
  policy_scope(Booking)
  @bookings = Booking.all.order("created_at DESC")
  @prestations = Prestation.all

  end

  def show
    @bookings = Booking.all
    @booking = Booking.find(params[:id])
    authorize @booking

   @prestation = @booking.prestation

  end

  def new
   @prestation = Prestation.find(params[:prestation_id])
   @booking = Booking.new(params[:id])
   authorize @booking
  end

    def create
      @prestation = Prestation.find(params[:prestation_id])
      @booking = Booking.new(booking_params)
      @booking.prestation = @prestation
      @booking.user = current_user
      authorize @booking
      @booking.save
      redirect_to booking_path(@booking)
    end


  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    redirect_to booking_path
  end

  private
  def booking_params
    params.require(:booking).permit(:description, :date, :location)
  end
end
