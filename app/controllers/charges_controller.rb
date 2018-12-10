class ChargesController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_participation

  def new

  end

  def create
    # Amount in cents

    @amount = @participation.amount_cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      =>  @amount,
      :description => 'Paiement de #{@participation.event_ref} , N° de commande #{@participation.id}',
      :currency    => 'eur'
    )

    @participation.update(payment: charge.to_json, status: 'paid')
    redirect_to participation_path(@participation)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_participation_charge_path(@participation)
  end


  private

    def set_participation
      @participation = current_user.participations.where(status: nil).find(params[:participation_id])
    end

end
