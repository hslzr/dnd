class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.text :description
      t.string :cast_time
      t.string :range
      t.string :components
      t.string :duration
      t.string :attack, default: 'false'
      t.text :atk_dmg, default: "{}"
      t.string :dmg_type, default: 'none'

      t.timestamps
    end
  end
end
