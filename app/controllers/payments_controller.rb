class PaymentsController < ApplicationController

  before_action :set_participation

    def new
      authorize @participation
    end


    def create

      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @participation.amount_cents,
        description:  "Paiement pour l'activité #{@participation.event_ref} pour la participation #{@participation.id}",
        currency:     @participation.amount.currency
      )
      @participation.update(payment: charge.to_json, status: 'payé')
      authorize @participation
      redirect_to participation_path(@participation)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_participation_payment_path(@participation)

    end

  private

    def set_participation
      @participation = current_user.participations.where(status: 'pending').find(params[:participation_id])
    end


end
