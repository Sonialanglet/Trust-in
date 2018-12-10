class ParticipationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    policy_scope(Participation)
    @participations = Participation.all.order("created_at DESC")
    @events = Event.all
  end

  def show

    @participation = Participation.find(params[:event_id])
    authorize @participation
    @event = Event.find(params[:event_id])


  end


  def new
    @participation = Participation.new
    @participation.user = current_user
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.event_ref = @event.name
    @participation.amount_cents = @event.price_cents * @participation.quantity
    authorize @participation
        if @participation.save

          redirect_to new_participation_charge_path(@participation)
        else
          render action: 'new'
        end
  end



  private

    def participation_params
      params.require(:participation).permit(:first_name, :last_name, :email, :phone, :status, :quantity, :event_ref, :amount_cents)
    end

end
