class CreateAccountReplacements < ActiveRecord::Migration[8.0]
  def change
    create_table :account_replacements do |t|
      t.integer :replaced_id
      t.integer :replacement_id
      t.integer :creator_id
      t.timestamps
    end
  end
end
