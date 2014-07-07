class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :messageboard, index: true
      t.integer :author

      t.timestamps
    end
  end
end
