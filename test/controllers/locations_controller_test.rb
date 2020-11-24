require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get locations_show_url
    assert_response :success
  end

  test "should get update" do
    get locations_update_url
    assert_response :success
  end

end
