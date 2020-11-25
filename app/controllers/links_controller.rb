class LinksController < ApplicationController

  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = Link.all
    render ({
      json: {
        message: "Success",
        links: @links
      },
      status: 200
    })
  end

  def show
    render ({
      json: {
        message: "Success",
        link: @link
      },
      status: 200
    })
  end

  def create
    @link = Link.new(link_params)
    
    if current_user.merchant.links << @link
      render ({
        json: {
          message: "Link created successfully",
          link: @link
        },
        status: 200
      })
    else
      render ({
        json: {
          error: "Unable to create link"
        },
        status: 409
      })
    end
  end

  def update
    if current_user.merchant.links.find(@link.id)
      if @link.update(link_params)        
        render ({
          json: {
            message: "Link updated successfully",
            link: @link
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
    else
      render ({
        json: {
          error: "Bad request"
        },
        status: 422 #unprocessable entity
      })
    end
  end

  def destroy
    if current_user.merchant.links.find(@link.id)
      if @link.destroy
        render ({
          json: {
            message: "Link deleted successfully",
            link: @link
          },
          status: 200
        })
      else
        render ({
          json: {
            error: "Unable to delete link"
          },
          status: 401 #unauthorized 
        })
      end
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

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.permit(:site_name, :url)
    end

end
