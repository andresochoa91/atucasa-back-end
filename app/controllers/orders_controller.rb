class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :update, :destroy]
  before_action :set_role, only: [:index]

  def index
    if @role
      render ({
        json: {
          message: "Success",
          orders: @role.orders
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
    if @order
      render ({
        json: {
          message: "Success",
          order: @order,
          products_order: @order.product_orders
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

  def create
    if current_user&.customer && params[:merchant_id]
      @order = Order.new(
        customer_id: current_user.customer.id,
        merchant_id: params[:merchant_id].to_i,
        accepted: false,
        current_user: "merchant",
        delivery_fee: 5,
        tip: params[:tip]
      )
      if @order.save

        #This is receiving a hash from the front-end. Ex:
        # "products": [
        #   {
        #     "id": 1,
        #     "amount": 2
        #   },
        #   {
        #     "id": 2,
        #     "amount": 3
        #   },
        # ]

        params[:products].each do |product|
          new_product = ProductOrder.new(
            product_id: product[:id],
            product_name: Product.find(product[:id]).product_name,
            price: Product.find(product[:id]).price,
            tax: Product.find(product[:id]).tax,
            amount: product[:amount]
          ) 
          @order.product_orders << new_product
        end

        render ({
          json: {
            message: "Order created successfully",
            order: @order,
            products: @order.product_orders
          },
          status: 200
        })
      else
        render ({
          json: {
            message: "Unable to create order"
          },
          status: 409
        })
      end
    else 
      render ({
        json: {
          message: "Not Found"
        },
        status: 404
      })
    end
  end

  def update
    if @order.update(order_params) 
      render ({
        json: {
          message: "Order updated successfully",
          order: @order,
          products_order: @order.product_orders
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
    if current_user.role == "customer"
      if @order.destroy
        render ({
          json: {
            message: "Order deleted successfully",
            order: @order,
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
          error: "Merchants are not allowed to delete orders"
        },
        status: 403 #Forbidden
      })
    end
  end

  private

    def order_params
      params.require(:order).permit(:accepted, :current_user, :tip)
    end

    def set_role
      @role ||= current_user.merchant || current_user.customer
    end

    def set_order
      @order ||= set_role.orders.find(params[:id])
    end
    
end
