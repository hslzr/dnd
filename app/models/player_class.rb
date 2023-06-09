class PlayerClass < ApplicationRecord
  serialize :features, Hash

  has_many :subclasses
  has_many :characters

  def to_param
    name
  end
end
