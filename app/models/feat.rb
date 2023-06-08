class Feat < ApplicationRecord
  serialize :features, Hash

  has_many :characters
end
