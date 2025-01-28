require "test_helper"

class SocialMediaAccountsControllerTest < ActionDispatch::IntegrationTest
  # Skip tests until new controller behaviour is finalized (not TDD)
  # setup do
  #   @social_media_account = social_media_accounts(:one)
  # end

  # test "should get index" do
  #   get social_media_accounts_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_social_media_account_url
  #   assert_response :success
  # end

  # test "should create social_media_account" do
  #   assert_difference("SocialMediaAccount.count") do
  #     post social_media_accounts_url, params: { social_media_account: { new_account: @social_media_account.new_account, new_platform: @social_media_account.new_platform, old_account: @social_media_account.old_account, old_platform: @social_media_account.old_platform, user_id: @social_media_account.user_id } }
  #   end

  #   assert_redirected_to social_media_account_url(SocialMediaAccount.last)
  # end

  # test "should show social_media_account" do
  #   get social_media_account_url(@social_media_account)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_social_media_account_url(@social_media_account)
  #   assert_response :success
  # end

  # test "should update social_media_account" do
  #   patch social_media_account_url(@social_media_account), params: { social_media_account: { new_account: @social_media_account.new_account, new_platform: @social_media_account.new_platform, old_account: @social_media_account.old_account, old_platform: @social_media_account.old_platform, user_id: @social_media_account.user_id } }
  #   assert_redirected_to social_media_account_url(@social_media_account)
  # end

  # test "should destroy social_media_account" do
  #   assert_difference("SocialMediaAccount.count", -1) do
  #     delete social_media_account_url(@social_media_account)
  #   end

  #   assert_redirected_to social_media_accounts_url
  # end
end
