require 'test_helper'

class MerchantsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get merchants_update_url
    assert_response :success
  end

end
