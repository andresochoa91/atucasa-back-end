class OrdersController < ApplicationController

  before_action :set_order_customer, only: [:update, :destroy]

  def index
    if @orders ||= Order.where(
      customer_id: current_user.customer.id, 
      merchant_id: params[:merchant_id].to_i      
    )
      render ({
        json: {
          message: "Success",
          orders: @orders
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

  def index_for_merchant
    if current_user&.merchant.orders
      render ({
        json: {
          message: "Success",
          orders: current_user.merchant.orders
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
    @order ||= Order.find_by(
      customer_id: current_user.customer.id, 
      merchant_id: params[:merchant_id].to_i,
      id: params[:id].to_i
    )
    
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

  def show_for_merchant    
    if current_user&.merchant.orders.find(params[:id])
      render ({
        json: {
          message: "Success",
          order: current_user.merchant.orders.find(params[:id]),
          products_order: current_user&.merchant.orders.find(params[:id]).product_orders
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
        # [
        #   {
        #     product_id: 1,
        #     amount: 2
        #   },
        #   {
        #     product_id: 2,
        #     amount: 3
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

  def update_for_merchant
    if current_user&.merchant.orders.find(params[:id]).update(order_params)
      render ({
        json: {
          message: "Order updated successfully",
          order: current_user&.merchant.orders.find(params[:id]),
          products_order: current_user&.merchant.orders.find(params[:id]).product_orders
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
  end

  private

    def order_params
      params.require(:order).permit(:accepted, :current_user, :tip)
    end

    def set_order_customer
      @order = current_user&.customer.orders.find(params[:id])
    end
    
end
