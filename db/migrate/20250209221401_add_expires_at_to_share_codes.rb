class AddExpiresAtToShareCodes < ActiveRecord::Migration[8.0]
  def change
    add_column :share_codes, :expires_at, :datetime, null: true
    add_column :share_codes, :hits, :integer, default: 0
  end
end
