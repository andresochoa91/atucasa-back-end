class CustomersController < ApplicationController
  # before_action :set_customer, only: [:show, :update]

  # def index
  #   @customers = Customer.all
  #   render ({
  #     json: {
  #       message: "Success",
  #       customers: @customers
  #     },
  #     status: 200
  #   })
  # end

  def show
    if current_user&.role == "customer"
      render ({
        json: {
          message: "Success",
          customer: set_customer
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

  def update
    if set_customer.update(customer_params)  
      if params[:username].present?
        slug = set_customer.username.parameterize

        while Customer.find_by(slug: slug) && set_customer.slug != slug
          slug += rand(0..9).to_s
        end

        set_customer.update(slug: slug) 
      end      

      render ({
        json: {
          message: "Customer updated successfully",
          customer: set_customer
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
      current_user.customer
    end

    def customer_params
      params.permit(:username, :first_name, :last_name, :phone_number, :location, :profile_picture)
    end
end
