class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    if current_user&.merchant
      @products = current_user.merchant.products
      render ({
        json: {
          message: "Success",
          products: @products
        },
        status: 200
      })
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

  def show
    if current_user&.merchant.products.find(params[:id])
      render ({
        json: {
          message: "Success",
          product: @product
        },
        status: 200
      })
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

  def create
    @product = Product.new(product_params)
    @product.update(tax: @product.price * 0.09)

    if current_user.merchant.products << @product
      render ({
        json: {
          message: "Product created successfully",
          product: @product
        },
        status: 200
      })
    else
      render json: { error: @product.errors }, status: 409
    end
  end

  def update
    if current_user.merchant.products.find(@product.id)
      if @product.update(product_params)
        @product.update(tax: @product.price * 0.09)        
        render ({
          json: {
            message: "Product updated successfully",
            product: @product
          },
          status: 200
        })
      else
        render json: { error: @product.errors }, status: 422 #unprocessable entity
      end
    else
      render json: { error: "Bad request" }, status: 422 #unprocessable entity
    end
  end

  def destroy
    if current_user.merchant.products.find(@product.id)
      if @product.destroy
        render ({
          json: {
            message: "Product deleted successfully",
            product: @product
          },
          status: 200
        })
      else
        render json: { error: "Unable to delete product" }, status: 401 #unauthorized 
      end
    else
      render json: { error: "Bad request" }, status: 422 #unprocessable entity
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
