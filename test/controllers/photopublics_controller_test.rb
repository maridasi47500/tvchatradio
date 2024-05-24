require "test_helper"

class PhotopublicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photopublic = photopublics(:one)
  end

  test "should get index" do
    get photopublics_url
    assert_response :success
  end

  test "should get new" do
    get new_photopublic_url
    assert_response :success
  end

  test "should create photopublic" do
    assert_difference("Photopublic.count") do
      post photopublics_url, params: { photopublic: { image: @photopublic.image, user_id: @photopublic.user_id } }
    end

    assert_redirected_to photopublic_url(Photopublic.last)
  end

  test "should show photopublic" do
    get photopublic_url(@photopublic)
    assert_response :success
  end

  test "should get edit" do
    get edit_photopublic_url(@photopublic)
    assert_response :success
  end

  test "should update photopublic" do
    patch photopublic_url(@photopublic), params: { photopublic: { image: @photopublic.image, user_id: @photopublic.user_id } }
    assert_redirected_to photopublic_url(@photopublic)
  end

  test "should destroy photopublic" do
    assert_difference("Photopublic.count", -1) do
      delete photopublic_url(@photopublic)
    end

    assert_redirected_to photopublics_url
  end
end
