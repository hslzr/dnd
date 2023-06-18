class PlayerClass < ApplicationRecord
  serialize :features, Hash
  serialize :custom, Hash
  serialize :equipment_choices, Hash

  has_many :subclasses
  has_many :characters

  def to_param
    name
  end
end
