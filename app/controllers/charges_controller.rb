class ChargesController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_participation

  def new

  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  private

    def set_participation
      @participation = current_user.participations.where(status: nil).find(params[:participation_id])
    end

end
