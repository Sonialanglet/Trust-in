class ParticipationsController < ApplicationController
  def index
    policy_scope(Participation)
    @participations = Participation.all.order("created_at DESC")
    @events = Event.all
  end

  def show

    @participation = current_user.participations.where(status: 'payé').find(params[:event_id])
    authorize @participation

    @event = @participation.event

  end


  def new
    @participation = Participation.new
    @participation.user = current_user
    @participation.event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.event_ref = @event.name
    @participation.status = "pending"
    @participation.amount = @event.price

    authorize @participation
        if @participation.save
          redirect_to new_participation_payment_path(@participation)
        else
          render action: 'new'
        end
  end



  private

    def participation_params
      params.require(:participation).permit(:first_name, :last_name, :email, :phone, :status, :quantity, :amount, :event_ref)
    end

end
