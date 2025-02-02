class DropSocialMediaAccounts < ActiveRecord::Migration[8.0]
  def change
    drop_table :social_media_accounts
  end
end
