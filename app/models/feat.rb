class Feat < ApplicationRecord
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  has_many :characters
end
