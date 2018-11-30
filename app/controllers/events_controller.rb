class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :must_be_admin, only: [:new, :create, :edit, :destroy, :update]

  def index
    @events = policy_scope(Event).order(date: :asc)
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
    @event = Event.new(event_params) do |event|
      event.user = current_user
      end
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
    params.require(:event).permit(:name, :teaser, :description, :resume, :photo, :date, :price, :number_of_participants)
  end

  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "les droits sont uniquement reservé à l'administrateur"
    end
  end

end
