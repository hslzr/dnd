class Race < ApplicationRecord
  has_many :characters
  has_many :subraces

  def to_param
    name
  end
end
