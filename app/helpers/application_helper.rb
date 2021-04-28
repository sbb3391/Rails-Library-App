module ApplicationHelper
  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    session.include?(:user_id)
  end
end
