class ChangeUser < ActiveRecord::Migration
  def change
  	remove_column :walls, :recipient_id
  	add_column :walls, :user_id, :integer
  end
end
