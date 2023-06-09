class AddProfsToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :weapons, :string, array: true, default: []
    add_column :backgrounds, :armor, :string, array: true, default: []
  end
end
