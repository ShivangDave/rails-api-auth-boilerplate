class ApplicationController < ActionController::API

  def current_user
  end

  def authenticate
    !!current_user
  end

end
