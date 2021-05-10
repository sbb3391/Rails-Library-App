class LibrariesController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :current_user

  def index
  end

  def show
    @library = Library.find_by_id(params[:id])

    if @library.user == @user
      render "libraries/show"
    else
      redirect_to invalid_libraries_path
    end
  end

  def invalid
  end
end
