require 'test_helper'

class TropasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tropas_index_url
    assert_response :success
  end

end
