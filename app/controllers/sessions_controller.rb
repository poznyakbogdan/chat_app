class SessionsController < ApplicationController
  before_action :get_user, only: :create

  def new

  end

  def create
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully Log in!"
      redirect_to users_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully log out!"
    redirect_to root_path
  end

  private

    def get_user
      @user = User.find_by_email params[:session][:email]
    end

end
