class ApplicationController < ActionController::Base
  def landing_page
    if session.include?(:user_id)
      @user = User.find_by(session[:user_id].to_s)
      redirect_to libraries_path
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
end
