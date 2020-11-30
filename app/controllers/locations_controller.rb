class LocationsController < ApplicationController

  before_action :set_location

  def show
    # key_name = use_new_name ? "new name" : "old name"
    if current_user
      render ({
        json: {
          message: "Success",
          location: @location
          # key_name => true
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Not Found",
        },
        status: 404  
      })
    end
  end

  def update
    if @location.update(location_params)
      render ({
        json: {
          message: "Location updated successfully",
          location: @location
          # key_name => true
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Unable to update user",
        },
        status: 401 #unauthorized 
      })
    end
  end

  private

    def set_location
      @location = current_user.location
    end

    def location_params
      params.require(:location).permit(:country, :state, :city, :address, :zip_code, :details)
    end

    # def use_new_name
    #   params[:use_new_name] == "true"
    # end
end
