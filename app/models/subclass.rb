class Subclass < ApplicationRecord
  belongs_to :player_class
  has_many :characters
end
