class ParticipationsController < ApplicationController
  def index
    policy_scope(Participation)
    @participations = Participation.all.order("created_at DESC")
    @events = Event.all
  end

  def show

    @participation = Participation.find(params[:event_id])
    authorize @participation

    @event = @participation.event

  end


  def new
    @participation = Participation.new
    @participation.user = current_user
    @participation.event = Event.find(params[:event_id])
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.event = Event.find(params[:event_id])
    authorize @participation
        if @participation.save
          redirect_to events_path, notice: "Vous êtes enregistré!"
        else
          render action: 'new'
        end
  end



  private

    def participation_params
      params.require(:participation).permit(:first_name, :last_name, :email, :phone, :status)
    end

end
