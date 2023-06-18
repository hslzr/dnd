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

item = {
  'codes'=>[x,y,z];
  'strings'=>[a,b,c];
}

writing in the seed should be easy

equipment_choices: {
  choices=> [
    {
      'codes'=>['shield'],
      'strings'=>['Longsword'],
    },
    {
      'codes'=>[],
      'strings'=>['Explorer\'s Pack', 'Dungeoneer\'s Pack'],
    },
    {
      'codes'=>['martial_weapon','simple_weapon'],
      'strings'=>[],
    },
  ],
  standard=> ['2 Handaxes','Arcane Focus']
}

codes = [
  'shield',
  'armor',
  'martial_weapon',
  'simple_weapon'
]

next I'll want an equipment shop so putting items in the database might be
the best way to go about things long-term, i want to be able to add items later in
the seed

Item model {
  name: string
  type: string
  subtype: string
  description: string
  atk_die: string
  ac_bonus: integer
  cost: integer //in copper pieces
}