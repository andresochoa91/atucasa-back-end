class UsersController < ApplicationController

  def show
    if current_user
      render ({
        json: {
          message: "Success",
          users: current_user
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Not found"
        },
        status: 404
      })
    end
  end

  def create
    if !current_user
      @user = User.new(user_params("create"))
      if @user.save
  
        login_hash = User.handle_login(params[:email], params[:password])
        cookies.signed[:jwt] = {value: login_hash[:token], httponly: true}

        render ({
          json: {
            message: "User created successfully",
            user: @user
          },
          status: 201
        })
      else
        render ({
          json: {
            error: "Unable to create user"
          },
          status: 409
        })
      end
    else
      render ({
        json: {
          error: "Unable to create user"
        },
        status: 409
      })
    end
  end

  def update
    if current_user && current_user.authenticate(params[:current_password])
      if current_user.update(user_params("update"))
        render ({
          json: {
            message: "User updated successfully",
            user: current_user
          },
          status: 200
        })
      else
        render ({
          json: {
            error: "Bad request"
          },
          status: 422 #unprocessable entity
        })
      end
    else
      render ({
        json: {
          error: "Not Found"
        },
        status: 404
      })
    end
  end

  def destroy
    if (current_user.id == @user.id)
      cookies.delete(:jwt)
  
      if @user.destroy
        render ({
          json: {
            message: "User deleted successfully",
            user: @user
          },
          status: 200
        })
      else
        render ({
          json: {
            error: "Unable to delete user"
          },
          status: 401 #unauthorized 
        })
      end
    else
      render ({
        json: {
          error: "Unable to delete user"
        },
        status: 401 #unauthorized 
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
