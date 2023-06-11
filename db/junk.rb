def backgrounds
  name
  skills
  weapons
  armor
  tools
  languages

  features []

  traits #redundant
  equipment
  ideals
  bonds
  flaws
  specialties
  specialty_description
  gold
end

def player_classes
  name
  weapons
  armor
  tools
  languages
  equipment

  features {}
  custom {}

  hit_die
  starting_hp
  primary_abilities
  saving_throws
  skill_choices
  num_skills
  equipment_choices
  spellcasting_ability
  num_cantrips
  num_spells
  spell_list
  wealth_die
  wealth_mult
end

def races
  name
  weapons
  armor
  tools
  skills

  features[]

  tool_choice
  size
  speed
  languages
  extra_languages
  asi
  age_limit
  heightlow
  heighthigh
end

def subclasses
  name
  weapons
  armor
  tools
  skills

  features {}
  custom {}

  player_class_id
end

def subrace
  name
  weapons
  armor
  tools
  skills

  features []

  languages
  extra_languages
  asi

  race_id
end

def feat
  name
  description
  features []
end

if (this.isChoicesFull() && this.str) {
      this.catUpdate({}, 'level');
    }
