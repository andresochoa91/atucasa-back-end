class CacheUrlsController < ApplicationController
  before_action :set_url

  def show
    if @url
      render ({
        json: {
          data: @url,
          status: "Success"
        },
        status: 200
      })
    else
      render ({
        json: {
          status: "Url Not Found"
        },
        status: 404
      })
    end
  end

  def create
    if !@url
      newUrl = CacheUrl.new({
        url: params[:url],
        strData: params[:strData]
      })
      if newUrl.save
        render ({
          json: {
            data: newUrl
          },
          status: 404
        })
      else
        render ({
          json: {
            error: "Unable to create url"
          },
          status: 404
        })
      end
    else
      render ({
        json: {
          error: "Url already in Cache"
        },
        status: 404
      })
    end 
  end

  private

    def set_url
      @url = CacheUrl.find_by(url: params[:url])
    end     

    def url_params
      params.permit(:url)
    end
end
