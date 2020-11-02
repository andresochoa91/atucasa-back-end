class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: {
      status: 200,
      message: "Success",
      users: @users
    }
  end

  def show
    render json: {
      status: 200,
      message: "Success",
      user: @user,
      user_extra_info: @user.role == "merchant" ? @user.merchant : @user.role == "customer" ? @user.customer : @user.admin
    }
  end

  def create
    @user = User.create(user_params)
    role_params = {}
    @role_info = {}

    if @user.role == "merchant"
      role_params = {
        name: params[:name],
        description: params[:description],
        address: params[:address],
        user_id: @user[:id]
      }
      @role_info = Merchant.create(role_params)
    elsif @user.role == "customer"
      role_params = {
        first_name: params[:first_name],
        last_name: params[:last_name],
        user_id: @user[:id]
      }
      @role_info = Customer.create(role_params)
    else
      role_params = {
        first_name: params[:first_name],
        last_name: params[:last_name],
        address: params[:address],
        user_id: @user[:id]
      }
      @role_info = Admin.create(role_params)
    end

    if @user && @role_info  
      render json: {
        status: 200,
        message: "Success",
        user: @user,
        role_info: @role_info
      }
    end
  end

  def update    

    if @user.update(user_params_update_only)
      render json: {
        status: 200,
        message: "User updated",
        user: @user,
        role_info: role_params
      }
    end

  end

  def destroy
    if @user
      if @user.role == "merchant"      
        Merchant.find_by(user_id: @user.id).destroy
      elsif @user.role == "customer"
        Customer.find_by(user_id: @user.id).destroy
      else
        Admin.find_by(user_id: @user.id).destroy
      end
    end

    if @user.destroy
      render json: {
        status: 200,
        message: "User deleted"
      }
    end
  end

  private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:phone, :email, :role)
    end

    def user_params_update_only
      params.require(:user).permit(:phone, :email)
    end

end
