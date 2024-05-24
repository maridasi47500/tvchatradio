require "application_system_test_case"

class PhotoprivesTest < ApplicationSystemTestCase
  setup do
    @photoprife = photoprives(:one)
  end

  test "visiting the index" do
    visit photoprives_url
    assert_selector "h1", text: "Photoprives"
  end

  test "should create photoprive" do
    visit photoprives_url
    click_on "New photoprive"

    fill_in "Image", with: @photoprife.image
    fill_in "User", with: @photoprife.user_id
    click_on "Create Photoprive"

    assert_text "Photoprive was successfully created"
    click_on "Back"
  end

  test "should update Photoprive" do
    visit photoprife_url(@photoprife)
    click_on "Edit this photoprive", match: :first

    fill_in "Image", with: @photoprife.image
    fill_in "User", with: @photoprife.user_id
    click_on "Update Photoprive"

    assert_text "Photoprive was successfully updated"
    click_on "Back"
  end

  test "should destroy Photoprive" do
    visit photoprife_url(@photoprife)
    click_on "Destroy this photoprive", match: :first

    assert_text "Photoprive was successfully destroyed"
  end
end
