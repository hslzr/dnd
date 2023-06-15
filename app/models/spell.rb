class Spell < ApplicationRecord
  has_and_belongs_to_many :class_spell_lists
end
