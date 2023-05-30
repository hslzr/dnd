class PlayerClass < ApplicationRecord
  has_many :subclasses
  has_many :characters
end
