class SessionsController < ApplicationController
  def new; end

  def create
    if User.select(:email).map(&:email).include?(params[:email])
      @user = User.find_by_email(params[:email])
      session[:user_id] = @user.id
      redirect_to welcome_path(@user), flash: { Well_done: 'Signed in successfuly' }
    else
      flash.now[:try_again] = 'email does not exist'
      render :new
    end
  end

  def welcome; end

  def destroy
    session.delete(:user_id)
    redirect_to welcome_path
  end
end
