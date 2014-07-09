class AddUserIdToWallposts < ActiveRecord::Migration
  def change
  	add_column :wallposts, :user_id, :integer
  	add_index :wallposts, :user_id
  end
end
