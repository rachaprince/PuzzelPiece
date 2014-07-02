class AddAuthorToWallpost < ActiveRecord::Migration
  def change
  	add_column :wallposts, :author_id, :integer 
  end
end
