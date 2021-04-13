class Api::V1::AuthController < ApplicationController

  # login flow
  def create
    # find the user
    @user = Api::V1::User.find_by(
      username: users_params[:username]
    )
    # if the user exists, check the password
    if @user && @user.authenticate(users_params[:password])
      # if all good, generate a token
      token = JWT.encode({ :user_id => @user.id }, ENV['JWT_TOKEN_SECRET'], 'HS256')
      # send the token as response
      render json: { :msg => "Login successful.", :token => token }, :status => :ok
    else
      # if authentication fails,
      # send the error message as response!
      render json: { :msg => "Login failure." }
    end
  end

  # Private methods
  private
  # Strong params => user
  def users_params
    # Only allow :username & :password
    # Users can login with their username & passwords
    # Note: email support can be added later if needed.
    params.require(:user).permit(:username, :password)
  end

end
