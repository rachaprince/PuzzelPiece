class AddUserIndexToWall < ActiveRecord::Migration
  def change
  	add_index :walls, :user_id
  end
end
