class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render ({
      json: {
        message: "Success",
        products: @products
      },
      status: 200
    })
  end

  def show
    render ({
      json: {
        message: "Success",
        product: @product
      },
      status: 200
    })
  end

  def create
    # puts current_user[:user_id]
    role = current_user[:role]
    email = current_user[:email]
    puts role, email, id
    # @product = Product.new(product_params)
    # if @product.save
    #   render ({
    #     json: {
    #       message: "Product updated successfully",
    #       product: @product
    #     },
    #     status: 200
    #   })
    # else
    #   render ({
    #     json: {
    #       error: "Unable to create product"
    #     },
    #     status: 409
    #   })
    # end
  end

  def update
    if @product.update(product_params)        
      render ({
        json: {
          message: "Product updated successfully",
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
    if @product.destroy
      render ({
        json: {
          message: "Product deleted successfully",
          product: @product
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Unable to delete product"
        },
        status: 401 #unauthorized 
      })
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:product_name, :description, :price, :available, :product_picture)
    end
end
