class EventsController < ApplicationController

  def index
    @events = policy_scope(Event).order(created_at: :desc)

  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @participation = Participation.new
  end


  private

  def event_params
    params.require(:post).permit(:content, :photo)
  end
end
