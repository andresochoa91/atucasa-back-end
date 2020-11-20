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

      @merchant.update(slug: @merchant.merchant_name.parameterize) if params[:merchant_name].present?
      
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
      params.permit(:merchant_name, :phone_number, :legal_id, :description)
    end
end
