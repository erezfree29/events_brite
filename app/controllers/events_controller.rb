class EventsController < ApplicationController

  def new
    if logged_in?
      @event = Event.new
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
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
    users_active_record = EventAttendee.select(:attendee_id).where(attended_event_id:params[:id])
    @users_ids_array = []
    users_active_record.each do |record|
      @users_ids_array << record[:attendee_id]
    end
  end

  def index
    if logged_in?
    @events = Event.all.order('date ASC')
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
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
    params.require(:event).permit(:name, :date, :author_id, :description, :location)
  end
end
