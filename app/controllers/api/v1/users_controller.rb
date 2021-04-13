class Api::V1::UsersController < ApplicationController

  # TEST: only see all users if authenticated
  before_action :authenticate, only: [:index]

  # def index
  #   @users = Api::V1::User.all
  #   render json: @users, :status => :ok
  # end

  # Signup flow
  def create
    # Instantiate a user
    @user = Api::V1::User.new(users_params)
    # If the user instance is valid
    if @user.valid?
      # Save it
      @user.save
      # Check if save was successful
      if @user.persisted?
        # If yes, send the message as response!
        render json: { :msg => "Signup successful." }
        # OR
        # can also send back the token.
        # depending on your user auth flow, choose your responses.

        # token = JWT.encode({ :user_id => @user.id }, ENV['JWT_TOKEN_SECRET'], 'HS256')
        # send the token as response
        # render json: { :msg => "Login successful.", :token => token }, :status => :ok
      else
        # If no, send the error message as response!
        render json: {
          :msg => "Signup failed. Contact the site administrator with the error messages.",
          :errors => @user.errors.full_messages
        }
      end
    else
      # if the user instance isn't valid
      # Send the error message as response!
      render json: {
        :msg => "User isn't valid. Check the errors for more info.",
        :errors => @user.errors.full_messages
      }
    end
  end

  # Private methods
  private
  # Strong params => user
  def users_params
    # Allow :username, :email, :password
    # Users can signup with their username, email & passwords
    # Note: Support for additional fields can be added later.
    params.require(:user).permit(:username, :email, :password)
  end

end
