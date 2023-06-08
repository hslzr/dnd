class PlayerClass < ApplicationRecord
  serialize :features, Hash

  has_many :subclasses
  has_many :characters
end
