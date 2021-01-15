class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :update, :destroy]
  before_action :set_role, only: [:index]

  def index
    if @role
      render ({
        json: {
          message: "Success",
          orders: @role.orders.map do |order|
            {
              id: order.id,
              customer_id: order.customer_id,
              merchant_id: order.merchant_id,
              accepted: order.accepted,
              canceled: order.canceled,
              delivery_fee: order.delivery_fee,
              current_user: order.current_user,
              tip: order.tip,
              message: order.message,
              products_order: ProductOrder.where(order_id: order.id),
              created_at: order.created_at,
              updated_at: order.updated_at,
              merchant_name: Merchant.find(order.merchant_id).merchant_name,
              merchant_slug: Merchant.find(order.merchant_id).slug,
              customer_name: Customer.find(order.customer_id).username,
              customer_picture: Customer.find(order.customer_id).profile_picture,
              customer_location: User.find(Customer.find(order.customer_id).user_id).location
            }
          end
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

  def check_delivered
    if Order.find(params[:id]).time_acceptance
      if Time.now.utc > (Order.find(params[:id]).time_acceptance.utc + 2.hours)
        render ({
          json: {
            message: "Order delivered",
            color: "green",
            order_placed: Order.find(params[:id]).time_acceptance.localtime
          }
        }),
        status: 200
      else
        render ({
          json: {
            message: "Your order is on the way",
            color: "#f60",
            order_placed: Order.find(params[:id]).time_acceptance.localtime,
            estimated_arrival: Order.find(params[:id]).time_acceptance.localtime + 2.hours
          }
        }),
        status: 200
      end
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
        canceled: false,
        delivered: true,
        current_user: "merchant",
        delivery_fee: params[:delivery_fee],
        tip: params[:tip],
        message: ""
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
            amount: product[:amount],
            available: true,
            amount_changed: false
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
      params.require(:order).permit(:accepted, :canceled, :current_user, :tip, :message, :time_acceptance)
    end

    def set_role
      @role ||= current_user.merchant || current_user.customer
    end

    def set_order
      @order ||= set_role.orders.find(params[:id])
    end
    
end
