class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :update]

  def show
    render json: {
      status: 200,
      message: "Success",
      merchant_data: @merchant
    }
  end

  def update
    if @merchant.update(merchant_params)
      render json: {
        status: 200,
        message: "Success",
        merchant_data: @merchant
      }
    end
  end

  private

    def set_merchant
      @merchant = Merchant.find_by(user_id: params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:name, :description, :address)
    end
end
