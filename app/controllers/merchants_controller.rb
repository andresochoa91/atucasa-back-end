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
      render ({
        json: {
          error: "Bad request"
        },
        status: 422 #unprocessable entity
      })
    end
  end

  def update
    if set_merchant.update(merchant_params)  
      if params[:merchant_name].present?
        slug = set_merchant.merchant_name.parameterize

        while Merchant.find_by(slug: slug) && set_merchant.slug != slug
          slug += rand(0..9).to_s
        end

        set_merchant.update(slug: slug) 
      end
      
      render ({
        json: {
          message: "Merchant updated successfully",
          merchant: set_merchant
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

    def set_merchant
      current_user.merchant
    end

    def merchant_params
      params.permit(:merchant_name, :phone_number, :tax_id, :description, :profile_picture, :background_picture)
    end
end
