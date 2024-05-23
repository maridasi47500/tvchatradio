require "test_helper"

class LocalizeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get localize_index_url
    assert_response :success
  end
end
