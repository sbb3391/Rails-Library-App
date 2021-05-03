class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
  end

  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      # build was not working here. @user.library was returning nil, so I couldn't run build on it
      Library.create(user_id: @user.id)
      return redirect_to library_path(@user.library)
    else
      render :new, alert: "User could not be created."
    end
  

  end

  def show
    current_user 
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :public)
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless logged_in?
  end

end
