class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :asi, array: true, default: [0,0,0,0,0,0]
      t.integer :age_limit, default: 500
      t.string :heightlow, default: "4'6\""
      t.string :heighthigh, default: "7\"6"
      t.string :languages, array: true, default: []
      t.integer :extra_languages, default: 0
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tool_choice, array: true, default: []
      t.string :size, default: 'medium'
      t.integer :speed, default: 15
      t.string :racial_traits, array: true, default: []

      t.timestamps
    end
  end
end
