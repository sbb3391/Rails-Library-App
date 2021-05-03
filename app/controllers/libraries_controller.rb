class LibrariesController < ApplicationController

  def index
    @user = User.find_by(session[:user_id].to_s)
  end

  def show 
    byebug
    @user = User.find_by_id(session[:user_id].to_s)
    @library = @user.library
    
  end
end
