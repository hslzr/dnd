class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.integer :player_class_id
      t.string :name
      t.text :features, default: "{}"
      t.text :custom, default: "{}"
      t.string :skills, array: true, default: []
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :description, default: ""

      t.timestamps
    end
  end
end
