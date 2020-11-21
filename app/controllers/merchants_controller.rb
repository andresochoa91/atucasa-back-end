class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :update]

  def index
    @merchants = Merchant.all
    render ({
      json: {
        message: "Success",
        merchants: @merchants
      },
      status: 200
    })
  end

  def show
    render ({
      json: {
        message: "Success",
        merchant: @merchant
      },
      status: 200
    })
  end

  def update
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
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.permit(:merchant_name, :phone_number, :legal_id, :description, :profile_picture, :background_picture)
    end
end
