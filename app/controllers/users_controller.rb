class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    # puts current_user.inspect
    # puts current_user.merchant.inspect
    @users = User.all
    render json: {
      message: "Success",
      users: @users
    }
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
      # @user.location = Location.create()

      # user_slug = slugify

      # if @user[:role] == "customer"
      #   @customer = Customer.new(
      #     username: user_slug,
      #     slug: user_slug
      #   )
      #   @user.customer = @customer
      # else
      #   @merchant = Merchant.new(
      #     merchant_name: user_slug,
      #     slug: user_slug
      #   )
      #   @user.merchant = @merchant
      # end

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
    # puts current_user.id
    # puts @user.id
    if (current_user.id == @user.id)
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
    if (current_user.id == @user.id)
      cookies.delete(:jwt)
      # @user.location.destroy
      # @user.merchant.products.destroy_all if @user.merchant
      # @user.customer.destroy if @user.customer
      # @user.merchant.destroy if @user.merchant
  
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

    def set_user
      @user = User.find(.])
    end

    def user_params(act)
      return act == "create" ?
        params.permit(:email, :password, :password_confirmation, :role) :
        params.permit(:email, :password)
    end

    # def slugify
    #   slug = (@user.email.split("@")[0]).parameterize

    #   while Customer.find_by(slug: slug) || Merchant.find_by(slug: slug)
    #     slug += (rand(0..9)).to_s
    #   end
      
    #   return slug
    # end

end
