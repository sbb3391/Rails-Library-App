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

  def omniauth
    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid] , provider: request.env['omniauth.auth'][:provider]) do |u|
      u.email = request.env['omniauth.auth'][:info][:email]
      u.username = request.env['omniauth.auth'][:info][:email].split("@")[0]
      u.password = SecureRandom.hex(15)
    end

    if user.valid?
      Library.create(user_id: user.id)
      session[:user_id] = user.id
      redirect_to books_path
    else
      redirect_to root_path
    end
  end

  # logout
  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

end
