class SessionsController < ApplicationController
  before_action only: [:destroy] do 
    authenticate_cookie
  end

  def destroy
    user = current_user
    if user  
      cookies.delete(:jwt)
      render json: {message: 'Logged out'}, status: 200
    else
      render json: {error: 'Session not found'}, code: 404
    end
  end

  def create
    if !current_user
      email = params["email"]
      password = params["password"]
      if email && password
        login_hash = User.handle_login(email, password)
        if login_hash
          cookies.signed[:jwt] = {
            value: login_hash[:token], 
            httponly: true,
            # same_site: :none,
            # secure: true,
            # domain: :all,
            expires: 2.hours.from_now
          }

          render json: login_hash
        else
          render json: {error: 'Incorrect email or password'}, status: 422  
        end
      else
        render json: {error: 'Specify email address and password'}, status: 422
      end
    else
      render json: { error: "User already logged in" }, status: 200
    end
  end

end
