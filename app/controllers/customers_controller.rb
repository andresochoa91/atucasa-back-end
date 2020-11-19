class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all
    render ({
      json: {
        message: "Success",
        customers: @customers
      },
      status: 200
    })
  end

  def show
    render ({
      json: {
        message: "Success",
        customer: @customer
      },
      status: 200
    })
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render ({
        json: {
          message: "User created successfully",
          customer: @customer
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
    # puts @customer.password
    if @customer.update(customer_params)
      render ({
        json: {
          message: "User updated successfully",
          customer: @customer
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
    if @customer.destroy
      render ({
        json: {
          message: "User deleted successfully",
          customer: @customer
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

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.permit(:username, :email, :password, :password_confirmation, :location, :phone_number)
    end

end
