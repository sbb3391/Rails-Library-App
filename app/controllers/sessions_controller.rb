class SessionsController < ApplicationController
  def login_form
  end

  def login
    @user = User.find_by_username(params[:session][:username])

    user = user.try(:authenticate, params[:session][:password])

    #redirect back to create_user form if they did not authenticate
    return redirect_to new_user_url unless user
  
    session[:user_id] = user.id

    redirect_to "index"
  end

end
