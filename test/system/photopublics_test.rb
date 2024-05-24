require "application_system_test_case"

class PhotopublicsTest < ApplicationSystemTestCase
  setup do
    @photopublic = photopublics(:one)
  end

  test "visiting the index" do
    visit photopublics_url
    assert_selector "h1", text: "Photopublics"
  end

  test "should create photopublic" do
    visit photopublics_url
    click_on "New photopublic"

    fill_in "Image", with: @photopublic.image
    fill_in "User", with: @photopublic.user_id
    click_on "Create Photopublic"

    assert_text "Photopublic was successfully created"
    click_on "Back"
  end

  test "should update Photopublic" do
    visit photopublic_url(@photopublic)
    click_on "Edit this photopublic", match: :first

    fill_in "Image", with: @photopublic.image
    fill_in "User", with: @photopublic.user_id
    click_on "Update Photopublic"

    assert_text "Photopublic was successfully updated"
    click_on "Back"
  end

  test "should destroy Photopublic" do
    visit photopublic_url(@photopublic)
    click_on "Destroy this photopublic", match: :first

    assert_text "Photopublic was successfully destroyed"
  end
end
