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
    @past_events = current_user.attended_events.previous
    @future_events = current_user.attended_events.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
