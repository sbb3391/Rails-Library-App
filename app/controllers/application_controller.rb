class ApplicationController < ActionController::Base
  def landing_page
    if session.include?(:user)

    end
  end

  private

  def current_user
    @user = User.find_by_id(session[:user_id])
  end

  def logged_in?
    session.include?(:user_id)
  end
end
