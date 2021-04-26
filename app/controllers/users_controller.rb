class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path(@user), flash: {well_done: "Signed in created!" }
    else
      render :new
    end
  end

  def show
    @events = Event.where(author_id:current_user.id).order("date ASC")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end



  