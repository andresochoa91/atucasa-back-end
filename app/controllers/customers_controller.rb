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
    if @customer.update(customer_params)  

      if params[:username].present?
        slug = @customer.username.parameterize

        while Customer.find_by(slug: slug) && @customer.slug != slug
          slug += rand(0..9).to_s
        end

        @customer.update(slug: slug) 
      end      

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
      params.permit(:username, :first_name, :last_name, :phone_number, :location, :profile_picture)
    end
end
