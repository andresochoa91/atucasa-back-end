class OrdersController < ApplicationController
  def index
    if @orders ||= current_user.customer.orders
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
          order: @order
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

        params[:products].each do |product|
          new_product = ProductOrder.new(
            product_id: product[:id],
            product_name: Product.find(product[:id]).product_name,
            price: Product.find(product[:id]).price,
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

  # def update
  # end

  # def destroy
  # end
end
