class CreateBlueskyAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :bluesky_accounts do |t|
      t.string :handle

      t.timestamps
    end
  end
end
