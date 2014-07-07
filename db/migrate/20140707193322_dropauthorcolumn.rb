class Dropauthorcolumn < ActiveRecord::Migration
  def change
  	remove_column  :messages, :author
  	add_column :messages, :user_id, :integer
  	add_index :messages, :user_id
  end
end
