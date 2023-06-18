class CreateEquipmentGearpacks < ActiveRecord::Migration[7.0]
  def change
    create_table :gearpacks_items, :id => false do |t|
      t.integer :equipment_id
      t.integer :gearpack_id

      t.timestamps
    end
  end
end
