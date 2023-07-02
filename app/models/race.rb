class Race < ApplicationRecord
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash

  has_many :characters
  has_many :subraces

  def to_param
    name
  end
end
