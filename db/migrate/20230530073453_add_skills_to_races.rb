class AddSkillsToRaces < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :skills, :string, array: true, default: []
  end
end
