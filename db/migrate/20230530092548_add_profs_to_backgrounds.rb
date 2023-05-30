class AddProfsToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :weapon_prof, :string, array: true, default: []
    add_column :backgrounds, :armor_prof, :string, array: true, default: []
  end
end
