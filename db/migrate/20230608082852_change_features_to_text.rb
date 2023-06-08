class ChangeFeaturesToText < ActiveRecord::Migration[7.0]
  def self.up
    change_table :subclasses do |t|
      t.change :features, :text
    end
    change_table :player_classes do |t|
      t.change :features, :text
    end
    change_table :feats do |t|
      t.change :features, :text
    end
  end

  def self.down
    change_table :subclasses do |t|
      t.change :features, :string
    end
    change_table :player_classes do |t|
      t.change :features, :string
    end
    change_table :feats do |t|
      t.change :features, :string
    end
  end
end
