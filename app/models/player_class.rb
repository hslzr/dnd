class PlayerClass < ApplicationRecord
  serialize :features, Hash
  serialize :custom, Hash

  has_many :subclasses
  has_many :characters

  def to_param
    name
  end
end
