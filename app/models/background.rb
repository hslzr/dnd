class Background < ApplicationRecord
  has_many :characters

  def to_param
    name
  end
end
