class CreatePlayerClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :player_classes do |t|
      t.string :name
      t.integer :hit_die
      t.integer :starting_hp
      t.integer :primary_abilities, array: true, default: []
      t.integer :saving_throws, array: true, default: []
      t.string :armor_prof, array: true, default: []
      t.string :weapon_prof, array: true, default: []
      t.string :tool_prof, array: true, default: []
      t.string :skill_choices, array: true, default: []
      t.integer :num_skills, default: 0
      t.string :equipment_choices, array: true, default: []
      t.string :equipment, array: true, default: []
      t.integer :spellcasting_ability, default: 0
      t.integer :num_cantrips, default: 0
      t.integer :num_spells, default: 0
      t.integer :spell_list, array: true, default: []
      t.integer :wealth_die, default: 2
      t.integer :wealth_mult, default: 10
      t.string :features, array: true, default: []

      t.timestamps
    end
  end
end
