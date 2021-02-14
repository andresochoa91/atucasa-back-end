class UsersController < ApplicationController

  def show
    if current_user
      render ({
        json: {
          message: "Success",
          user: {
            id: current_user.id,
            email: current_user.email,
            role: current_user.role
          }
        },
        status: 200
      })
    elsif (params[:id])
      @user = User.find(params[:id])
      render ({
        json: {
          message: "Success",
          user: {
            id: @user.id,
            email: @user.email,
            role: @user.role
          }
        },
        status: 200
      })
    else
      render json: { error: "Not found" }, status: 404
    end
  end

  def create
    if !current_user
      @user = User.new(user_params("create"))
      if @user.save
        
        login_hash = User.handle_login(params[:email], params[:password])
        response.set_header('Authorization', login_hash[:token])
        render json: { message: "User created successfully" }, status: 201

      else
        render json: { error: @user.errors }, status: 409
      end
    else
      render json: { error: "User already logged" }, status: 409
    end
  end

  def update
    @user = current_user
    if @user && @user.authenticate(params[:current_password])
      # @user = User.find(params[:id])
      if @user.update(user_params("update"))
        render ({
          json: {
            message: "User updated successfully",
            user: @user
          },
          status: 200
        })
      else
        render json: { error: @user.errors }, status: 422 #unprocessable entity
      end
    else
      render ({
        json: {
          error: { current_password: "Current password is not correct, try again!" }
        },
        status: 404
      })
    end
  end

  private

    def user_params(act)
      return act == "create" ?
        params.permit(:email, :password, :password_confirmation, :role) :
        params.permit(:email, :password)          
    end

end
