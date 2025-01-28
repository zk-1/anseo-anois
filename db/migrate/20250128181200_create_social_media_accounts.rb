class CreateSocialMediaAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :social_media_accounts do |t|
      t.references :user, null: false, foreign_key: false
      t.string :old_platform
      t.string :old_account
      t.string :new_platform
      t.string :new_account

      t.timestamps
    end
  end
end
