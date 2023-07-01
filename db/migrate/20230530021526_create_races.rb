class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :asi, array: true, default: [0,0,0,0,0,0]
      t.integer :age_limit, default: 500
      t.string :heightlow, default: "4'6\""
      t.string :heighthigh, default: "7\"6"
      t.string :languages, array: true, default: []
      t.string :extra_languages
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :skills, array: true, default: []
      t.string :tool_choice, array: true, default: []
      t.string :size, default: 'medium'
      t.integer :speed, default: 15
      t.string :features, array: true, default: []
      t.integer :sub_count, default: 0

      t.timestamps
    end
  end
end
