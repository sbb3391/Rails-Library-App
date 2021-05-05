class LibrariesController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :current_user

  def index
  end

  def show
    byebug
    @library = @user.library
  end
end
