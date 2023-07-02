class Feat < ApplicationRecord
  serialize :extra_spells, Hash
  has_many :characters
end
