class Subclass < ApplicationRecord
  serialize :custom, Hash
  serialize :features, Hash

  belongs_to :player_class
  has_many :characters


end
