class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.integer :player_class_id
      t.string :name
      t.string :features, array: true, default: []
      t.string :skills, array: true, default: []
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []

      t.timestamps
    end
  end
end
