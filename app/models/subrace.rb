class Subrace < ApplicationRecord
  serialize :extra_spells, Hash

  belongs_to :race
  has_many :characters

  def to_param
    name
  end
end
