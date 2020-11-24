class LocationsController < ApplicationController

  before_action :set_location

  def show
    render ({
      json: {
        message: "Success",
        location: @location
      },
      status: 200
    })
  end

  def update
    if @user == current_user
      if @location.update(location_params)
        render ({
          json: {
            message: "Location updated successfully",
            location: @location
          },
          status: 200
        })
      else
        render ({
          json: {
            error: "Unable to update user"
          },
          status: 401 #unauthorized 
        })
      end
    else
      render ({
        json: {
          error: "Unable to update user"
        },
        status: 401 #unauthorized 
      })
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_location
      @location = set_user.location
    end

    def location_params
      params.require(:location).permit(:country, :state, :city, :address, :zip_code, :details)
    end
end
