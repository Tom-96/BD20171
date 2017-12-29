require 'test_helper'

class RecursosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recursos_index_url
    assert_response :success
  end

end
