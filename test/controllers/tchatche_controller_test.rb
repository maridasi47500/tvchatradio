require "test_helper"

class TchatcheControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get tchatche_profile_url
    assert_response :success
  end

  test "should get chat" do
    get tchatche_chat_url
    assert_response :success
  end
end
