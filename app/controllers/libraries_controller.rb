class LibrariesController < ApplicationController

  def index
    @user = User.find_by(session[:user_id].to_s)
  end
end
