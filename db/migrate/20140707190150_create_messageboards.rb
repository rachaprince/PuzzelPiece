class CreateMessageboards < ActiveRecord::Migration
  def change
    create_table :messageboards do |t|
      t.text :text

      t.timestamps
    end
  end
end
