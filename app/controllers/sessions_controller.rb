class SessionsController < ApplicationController

    def create
        # Downcase the email from the request
        email = params[:email].downcase
      
        # Find the user by downcased email
        user = User.find_by("LOWER(email) = ?", email)
      
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id 
          render json: user
        else
          Rails.logger.error("Login failed for email: #{email}")
          render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
      end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
