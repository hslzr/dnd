class Subrace < ApplicationRecord
  belongs_to :race
  has_many :characters

  def to_param
    name
  end
end
