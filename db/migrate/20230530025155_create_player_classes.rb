class CreatePlayerClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :player_classes do |t|
      t.string :name
      t.integer :hit_die
      t.integer :starting_hp
      t.integer :primary_abilities, array: true, default: []
      t.integer :saving_throws, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :weapons, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :skill_choices, array: true, default: []
      t.integer :num_skills, default: 0
      t.string :equipment_choices, array: true, default: []
      t.string :equipment, array: true, default: []
      t.integer :spellcasting_ability, default: 0
      t.integer :spell_table, array: true, default: []
      #11x20 array of ints, num spells known, num cantrip, num levels 1-9
      t.integer :wealth_die, default: 2
      t.integer :wealth_mult, default: 10
      t.text :features, default: "{}"
      t.text :custom, default: "{}"

      t.timestamps
    end
  end
end
