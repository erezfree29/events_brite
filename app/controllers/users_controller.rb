class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path(@user), flash: { well_done: 'Account created!' }
    else
      render :new
    end
  end

  def show
    events_active_record = EventAttendee.select(:attended_event_id).where(attendee_id: current_user.id)
    @events_ids_array = []
    events_active_record.each do |record|
      @events_ids_array << record[:attended_event_id]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
