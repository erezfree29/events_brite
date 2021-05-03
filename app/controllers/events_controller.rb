class EventsController < ApplicationController
  def new
    if logged_in?
      @event = Event.new
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event), flash: { well_done: 'event created!' }
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.created_events.include?(@event)
      @event.destroy
      redirect_to root_path
    end
  end

  def index
    if logged_in?
      @past_events = Event.all.order('date ASC').previous
      @upcoming_events = Event.all.order('date ASC').upcoming
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end


  def attend
    if EventAttendee.where(user_id: current_user.id).where(event_id: params[:id]).length.zero?
      EventAttendee.create(user_id: current_user.id,event_id: params[:id])
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
