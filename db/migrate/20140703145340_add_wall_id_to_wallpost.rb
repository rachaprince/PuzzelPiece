class AddWallIdToWallpost < ActiveRecord::Migration
  def change
  	add_column	:wallposts, :wall_id, :integer
  	add_index	:wallposts, :wall_id
  end
end
