class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show_merchant_data, :update]

  def index
    @merchants = Merchant.all.map do |merchant|
      {
        message: "Success",
        merchant_info:  merchant,
        products: merchant.products,
        links: merchant.links,
        email: merchant.user.email,
        location: merchant.user.location,
        user_id: merchant.user.id
      }
    end

    render ({
      json: {
        message: "Success",
        merchants: @merchants
      },
      status: 200
    })
  end

  def index_searchbox
    products = Product.where("product_name ILIKE ?", "%#{(params[:searchbox])}%").where(available: true)
    @merchants = products.map do |product|
      merchant = product.merchant
      {
        message: "Success",
        merchant_info:  merchant,
        products: merchant.products,
        links: merchant.links,
        email: merchant.user.email,
        location: merchant.user.location,
        user_id: merchant.user.id,
      }
    end

    render ({
      json: {
        message: "Success",
        merchants: @merchants
      },
      status: 200
    })
  end

  def show
    @merchant = Merchant.find(params[:id])
    render ({
      json: {
        message: "Success",
        merchant_info: @merchant,
        products: @merchant.products,
        links: @merchant.links,
        email: @merchant.user.email,
        location: @merchant.user.location
      },
      status: 200
    })
  end

  def show_through_slug
    @merchant = Merchant.find_by(slug: params[:slug])
    render ({
      json: {
        message: "Success",
        merchant_info: @merchant,
        products: @merchant.products,
        links: @merchant.links,
        email: @merchant.user.email,
        location: @merchant.user.location
      },
      status: 200
    })
  end

  def show_merchant_data
    if current_user&.role == "merchant"
      render ({
        json: {
          message: "Success",
          merchant: set_merchant
        },
        status: 200
      })
    else
      render json: { error: "Bad request" }, status: 422 #unprocessable entity
    end
  end

  def update
    @merchant = set_merchant
    if @merchant.update(merchant_params)  
      if params[:merchant_name].present?
        slug = @merchant.merchant_name.parameterize

        while Merchant.find_by(slug: slug) && @merchant.slug != slug
          slug += rand(0..9).to_s
        end

        @merchant.update(slug: slug) 
      end
      
      render ({
        json: {
          message: "Merchant updated successfully",
          merchant: @merchant
        },
        status: 200
      })
    else
      render json: { error: @merchant.errors }, status: 422 #unprocessable entity
    end
  end

  private

    def set_merchant
      current_user.merchant
    end

    def merchant_params
      params.permit(:merchant_name, :phone_number, :tax_id, :description, :profile_picture, :background_picture, :slug, :searchbox)
    end
end
