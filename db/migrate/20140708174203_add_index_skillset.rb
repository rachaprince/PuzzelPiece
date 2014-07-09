class AddIndexSkillset < ActiveRecord::Migration
  def change
 	add_index :skillsets, :skill_id
 	add_index :skillsets, :user_id
  end
end
