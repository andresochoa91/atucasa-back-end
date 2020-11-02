class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update]

  def show
    render json: {
      status: 200,
      message: "Success",
      admin_data: @admin
    }
  end

  def update
    if @admin.update(admin_params)
      render json: {
        status: 200,
        message: "Success",
        admin_data: @admin
      }
    end
  end

  private

    def set_admin
      @admin = Admin.find_by(user_id: params[:id])
    end

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :address)
    end
end
