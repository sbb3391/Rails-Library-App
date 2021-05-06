class LibrariesController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :current_user

  def index
  end

  def show
    binding.pry
    @library = Library.find_by_id(params[:id])
  end
end
