class EventsController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @participation = Participation.new
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
      authorize @event
    if @event.save
      redirect_to events_path
    else
      redirect_to root_path, notice: @event.errors.full_messages.first
    end
  end


  def edit
   @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
    redirect_to event_path(@event)
  end


  def destroy
   @event = Event.find(params[:id])
    @event.destroy
    authorize @event
    redirect_to events_path
  end

  private


  def event_params
    params.require(:event).permit(:name, :teaser, :description, :photo, :date, :price)
  end

  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "les droits sont uniquement reservé à l'administrateur"
    end
  end

end
