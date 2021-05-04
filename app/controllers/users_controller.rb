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
      render :new
    end
  

  end

  def show
    current_user 
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :public)
  end

end
