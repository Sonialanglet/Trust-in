class AnswersController < ApplicationController


  def create
    @booking = Booking.find(params[:booking_id])
    @answer = Answer.new(answer_params)
    @answer.booking = @booking
    authorize @answer
    @answer.save

    redirect_to booking_path(@booking)
  end


  private

  def answer_params
    params.require(:answer).permit(:content).merge(:user_id => current_user.id)
  end

end
