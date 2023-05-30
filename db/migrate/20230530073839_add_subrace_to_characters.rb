class AddSubraceToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :subrace_id, :integer
  end
end
