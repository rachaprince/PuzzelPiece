class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
    	t.integer :skill_id
    	t.integer :idea_id
      t.timestamps
    end
    add_index :requirements, :skill_id
    add_index :requirements, :idea_id
  end
end
