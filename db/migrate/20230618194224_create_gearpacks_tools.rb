class CreateGearpacksTools < ActiveRecord::Migration[7.0]
  def change
    create_table :gearpacks_tools, :id => false do |t|
      t.integer :gearpack_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
