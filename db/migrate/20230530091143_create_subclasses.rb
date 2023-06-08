class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.integer :player_class_id
      t.string :name
      t.string :features, array: true, default: []
      t.text :custom
      t.string :method, default: ""

      t.timestamps
    end
  end
end
