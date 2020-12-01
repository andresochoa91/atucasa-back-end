class ProductOrdersController < ApplicationController

  before_action :set_products, only: [:index]
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    if @products
      render ({
        json: {
          message: "Success",
          products: @products
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Not Found"
        },
        status: 404
      })
    end
  end

  def show
    if @product
      render ({
        json: {
          message: "Success",
          product: @product
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Not Found"
        },
        status: 404
      })
    end
  end

  def update
    if @product&.update(amount: params[:amount])
      render ({
        json: {
          message: "Product in order updated successfully",
          product: @product
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
    if @product&.destroy
      render ({
        json: {
          message: "Product in order deleted successfully",
          product: @product
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

    def set_products
      @products ||= current_user.customer.orders.find(params[:order_id]).product_orders
    end

    def set_product
      @product ||= set_products&.find(params[:id])
    end

end
