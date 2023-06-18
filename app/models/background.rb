class Background < ApplicationRecord
  serialize :equipment_choices, Hash
  has_many :characters

  def to_param
    name
  end
end
