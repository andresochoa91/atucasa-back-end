class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authenticate_cookie
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      if decoded_token[:username]
        user = Customer.find_by(id: decoded_token[:customer_id])
      end
    end
    if user then return true else render json: {status: 'unauthorized', code: 401} end
  end

  def current_user
    token = cookies.signed[:jwt]
    decoded_token = CoreModules::JsonWebToken.decode(token)
    if decoded_token
      user = Customer.find_by(id: decoded_token[:customer_id])
    end
    if user then return user else return false end
  end
end
