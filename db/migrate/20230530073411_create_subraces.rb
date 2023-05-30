class CreateSubraces < ActiveRecord::Migration[7.0]
  def change
    create_table :subraces do |t|
       t.integer :race_id
      t.string :name
      t.integer :asi, array: true, default: []
      t.string :languages, array: true, default: []
      t.integer :extra_languages
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :skills, array: true, default: []
      t.string :racial_traits, array: true, default: []
      t.string :method

      t.timestamps
    end
  end
end
