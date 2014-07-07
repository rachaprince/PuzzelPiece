class AddBioColumnToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :bio, :text
  end
end
