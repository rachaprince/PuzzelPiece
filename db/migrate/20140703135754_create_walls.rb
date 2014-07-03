class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :recipient_id
      t.integer :post_id

      t.timestamps
    end
    add_index :walls, :recipient_id
    add_index :walls, :post_id
    add_index :walls, [:recipient_id, :post_id], unique: true
  end
end
