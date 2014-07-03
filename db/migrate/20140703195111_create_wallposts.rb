class CreateWallposts < ActiveRecord::Migration
  def change
    create_table :wallposts do |t|
      t.text :content
      t.references :wall, index: true

      t.timestamps
    end
  end
end
