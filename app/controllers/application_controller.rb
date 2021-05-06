class ApplicationController < ActionController::Base
  def landing_page
    byebug
    if session.include?(:user_id)
      @user = User.find_by_id(session[:user_id].to_s)
      redirect_to library_path(@user.library)
    else
      render "application/landing_page"
    end
  end

  private

  def current_user
    @user = User.find_by_id(session[:user_id].to_s)
  end

  def logged_in?
    session.include?(:user_id)
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless logged_in?
  end
end
