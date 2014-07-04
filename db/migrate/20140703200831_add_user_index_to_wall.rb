class AddUserIndexToWall < ActiveRecord::Migration
  def change
  	add_column :walls, :user_id, :integer
  	add_index :walls, :user_id
  end
end
