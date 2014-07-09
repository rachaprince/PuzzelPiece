class AddTeamId < ActiveRecord::Migration
  def change
  	add_column :messageboards, :team_id, :integer
  	add_index :messageboards, :team_id
  end
end
