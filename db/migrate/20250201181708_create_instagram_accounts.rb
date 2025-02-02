class CreateInstagramAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :instagram_accounts do |t|
      t.string :username

      t.timestamps
    end
  end
end
