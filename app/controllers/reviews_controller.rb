class ReviewsController < ApplicationController


  def create
    @prestation = Prestation.find(params[:prestation_id])
    @review = Review.new(review_params)

    @review.prestation = @prestation

    authorize @review
    @review.save
    redirect_to prestation_path(@prestation)

  end



  private

  def review_params
    params.require(:review).permit( :comment, :rating).merge(:user_id => current_user.id)
  end

end
