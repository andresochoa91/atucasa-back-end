class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update]

  def show
    render json: {
      status: 200,
      message: "Success",
      customer_data: @customer
    }
  end

  def update
    if @customer.update(customer_params)
      render json: {
        status: 200,
        message: "Success",
        customer_data: @customer
      }
    end
  end

  private

    def set_customer
      @customer = Customer.find_by(user_id: params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name)
    end
end
