class ApplicationController < ActionController::API

  before_action :authenticate_cookie, :current_user

  private

    def auth_header
      request.headers['Authorization']
    end

    def authenticate_cookie
      if auth_header
        decoded_token = CoreModules::JsonWebToken.decode(auth_header)
        if decoded_token
          user = User.find_by(id: decoded_token[:user_id])
        end
        if user then return true else render json: {error: 'unauthorized'}, code: 401 end
      end
    end

    def current_user
      if auth_header
        decoded_token = CoreModules::JsonWebToken.decode(auth_header)
        if decoded_token
          user = User.find_by(id: decoded_token[:user_id])
        end
        if user then return user else return false end
      end
    end

end
