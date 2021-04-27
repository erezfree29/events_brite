class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.author_id = current_user.id
    if @event.save
      redirect_to event_path(@event), flash: {well_done: "event created!" }
    else
        render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all.order("date ASC")
  end

  def attend
    EventAttendee.create(attendee_id:current_user.id,attended_event_id:params[:id])
    redirect_to user_path(current_user), flash: {well_done: "event booked"}
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :author_id, :description)
  end
end
