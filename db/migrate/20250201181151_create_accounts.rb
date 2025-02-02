class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.boolean :publicly_visible
      t.integer :owner_id
      t.integer :accountable_id
      t.string :accountable_type

      t.timestamps
    end
  end
end
