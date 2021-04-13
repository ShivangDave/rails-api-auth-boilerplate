class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Auth-Token']
    begin
      payload = JWT.decode token, ENV['JWT_TOKEN_SECRET']
      @user = Api::V1::User.find_by(id: payload[0][:user_id])
      return @user
    rescue JWT::DecodeError
      render json: { :msg => "Not logged in!" }
    end
  end

  def authenticate
    !!current_user
  end

end
