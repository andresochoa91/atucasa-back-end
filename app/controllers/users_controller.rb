class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render ({
      json: {
        message: "Success",
        users: @users
      },
      status: 200
    })
  end

  def show
    render ({
      json: {
        message: "Success",
        user: @user
      },
      status: 200
    })
  end

  def create
    @user = User.new(user_params("create"))
    if @user.save
      @user.merchant = Merchant.create(merchant_name: "johan")
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
  end

  def update
    # puts @user.password
    if @user.update(user_params("update"))
      render ({
        json: {
          message: "User updated successfully",
          user: @user
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
  end

  def destroy
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
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params(act)
      return act == "create" ?
        params.permit(:email, :password, :password_confirmation, :role) :
        params.permit(:email, :password)
    end

end
