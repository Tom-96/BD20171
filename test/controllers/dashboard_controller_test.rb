require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get menu_user" do
    get dashboard_menu_user_url
    assert_response :success
  end

  test "should get menu_admin" do
    get dashboard_menu_admin_url
    assert_response :success
  end

end
