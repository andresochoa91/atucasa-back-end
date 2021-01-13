require 'test_helper'

class CacheUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cache_urls_show_url
    assert_response :success
  end

  test "should get create" do
    get cache_urls_create_url
    assert_response :success
  end

end
