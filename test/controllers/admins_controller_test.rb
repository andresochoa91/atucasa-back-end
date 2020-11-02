require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_update_url
    assert_response :success
  end

end
