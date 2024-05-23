require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get settings_profile_url
    assert_response :success
  end

  test "should get research" do
    get settings_research_url
    assert_response :success
  end

  test "should get album" do
    get settings_album_url
    assert_response :success
  end

  test "should get interests" do
    get settings_interests_url
    assert_response :success
  end

  test "should get account" do
    get settings_account_url
    assert_response :success
  end
end
