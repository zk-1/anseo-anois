require "application_system_test_case"

class SocialMediaAccountsTest < ApplicationSystemTestCase
  setup do
    @social_media_account = social_media_accounts(:one)
  end

  test "visiting the index" do
    visit social_media_accounts_url
    assert_selector "h1", text: "Social media accounts"
  end

  test "should create social media account" do
    visit social_media_accounts_url
    click_on "New social media account"

    fill_in "New account", with: @social_media_account.new_account
    fill_in "New platform", with: @social_media_account.new_platform
    fill_in "Old account", with: @social_media_account.old_account
    fill_in "Old platform", with: @social_media_account.old_platform
    fill_in "User", with: @social_media_account.user_id
    click_on "Create Social media account"

    assert_text "Social media account was successfully created"
    click_on "Back"
  end

  test "should update Social media account" do
    visit social_media_account_url(@social_media_account)
    click_on "Edit this social media account", match: :first

    fill_in "New account", with: @social_media_account.new_account
    fill_in "New platform", with: @social_media_account.new_platform
    fill_in "Old account", with: @social_media_account.old_account
    fill_in "Old platform", with: @social_media_account.old_platform
    fill_in "User", with: @social_media_account.user_id
    click_on "Update Social media account"

    assert_text "Social media account was successfully updated"
    click_on "Back"
  end

  test "should destroy Social media account" do
    visit social_media_account_url(@social_media_account)
    click_on "Destroy this social media account", match: :first

    assert_text "Social media account was successfully destroyed"
  end
end
