class ReviewsController < ApplicationController
  def new
    @prestation = Prestation.find(params[:prestation_id])

    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.prestation = Prestation.find(params[:prestation_id])
    authorize @review
    if @review.save
      redirect_to prestation_path(@prestation)
    else
      render :new
    end
  end
end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
