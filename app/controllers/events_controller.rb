class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.author_id = current_user.id
    if @event.save
      redirect_to event_path(@event), flash: { well_done: 'event created!' }
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all.order('date ASC')
  end

  def attend
    if EventAttendee.where(attendee_id: current_user.id).where(attended_event_id: params[:id]).length.zero?
      EventAttendee.create(attendee_id: current_user.id, attended_event_id: params[:id])
      redirect_to user_path(current_user), flash: { success: 'you have booked a spot in the event' }
    else
      redirect_to events_path, flash: { error: 'you are already booked to this event' }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :author_id, :description , :location)
  end
end
