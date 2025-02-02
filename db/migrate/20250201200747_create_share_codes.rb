class CreateShareCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :share_codes do |t|
      t.string :code
      t.boolean :active
      t.integer :creator_id
      t.integer :share_code_protectable_id
      t.string :share_code_protectable_type

      t.timestamps
    end
  end
end
