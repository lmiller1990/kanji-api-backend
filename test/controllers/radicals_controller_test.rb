require 'test_helper'

class RadicalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get radicals_index_url
    assert_response :success
  end

end
