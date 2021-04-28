class ApplicationController < ActionController::Base
  def landing_page
    if session.include?(:user)

    end
  end
end
