class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update]

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

  def update
    # puts @customer.password
    if @customer.update(customer_params)
      render ({
        json: {
          message: "Customer updated successfully",
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

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.permit(:username, :phone_number, :location)
    end
end
