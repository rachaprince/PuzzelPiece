class AddingIdeastoTeams < ActiveRecord::Migration
  def change
  	add_column :ideas, :team_id, :integer
  	add_index :ideas, :team_id
  end
end
