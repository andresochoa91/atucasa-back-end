class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception

  def authenticate_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by(id: decoded_token[:user_id])
    end
    if user then return true else render json: {error: 'unauthorized'}, code: 401 end
  end

  def current_user
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = User.find_by(id: decoded_token[:user_id])
    end
    if user then return user else return false end
  end
end
