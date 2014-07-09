class CreateSkillsets < ActiveRecord::Migration
  def change
    create_table :skillsets do |t|
      t.integer :skill_id
      t.integer :user_id

      t.timestamps
    end
  end
end
