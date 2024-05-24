require "test_helper"

class PhotoprivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photoprife = photoprives(:one)
  end

  test "should get index" do
    get photoprives_url
    assert_response :success
  end

  test "should get new" do
    get new_photoprife_url
    assert_response :success
  end

  test "should create photoprife" do
    assert_difference("Photoprive.count") do
      post photoprives_url, params: { photoprife: { image: @photoprife.image, user_id: @photoprife.user_id } }
    end

    assert_redirected_to photoprife_url(Photoprive.last)
  end

  test "should show photoprife" do
    get photoprife_url(@photoprife)
    assert_response :success
  end

  test "should get edit" do
    get edit_photoprife_url(@photoprife)
    assert_response :success
  end

  test "should update photoprife" do
    patch photoprife_url(@photoprife), params: { photoprife: { image: @photoprife.image, user_id: @photoprife.user_id } }
    assert_redirected_to photoprife_url(@photoprife)
  end

  test "should destroy photoprife" do
    assert_difference("Photoprive.count", -1) do
      delete photoprife_url(@photoprife)
    end

    assert_redirected_to photoprives_url
  end
end
