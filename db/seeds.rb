# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Race.destroy_all
PlayerClass.destroy_all
Background.destroy_all
Feat.destroy_all
Character.destroy_all

User.create(
  email: "net@map.com",
  password: "netmap",
  password_confirmation: "netmap"
)

DwarvenRace = Race.create(
  name: 'Dwarf',
  asi: [0,0,2,0,0,0],
  age_limit: 450,
  heightlow: "4'",
  heighthigh: "5'",
  languages: ['Common', 'Dwarvish'],
  weapons: ['Battleaxe', 'Handaxe', 'Light Hammer', 'Warhammer'],
  tool_choice: [
    'Smith`s Tools',
    'Brewer`s Supplies',
    'Mason`s Tools',
  ],
  speed: 25,
  racial_traits: [
    'Speed not reduced by heavy armor',
    'Darkvision',
    'Dwarven Resilience: Advantage on Poison saves and resistance to Poison damage.',
    'Stonecunning: Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.',
  ]
)

DwarvenRace.subraces.create(
  name: 'Hill Dwarves',
  asi: [0,0,0,0,1,0],
  racial_traits: [
        'Dwarven Toughness: Your level is added to your hit point maximum.',
      ],
  extra_languages: 0,
  method: ''
)

DwarvenRace.subraces.create(
  name: 'Mountain Dwarves',
  asi: [2,0,0,0,0,0],
  racial_traits: ['Dwarven Armor Training: Light and Medium'],
  armor: ['Light','Medium'],
  extra_languages: 0,
  method: ''
)

Barbarian = PlayerClass.create(
  name: 'Barbarian',
  hit_die: 12,
  starting_hp: 12,
  primary_abilities: [1],
  saving_throws: [1,3],
  armor_prof: ['light', 'medium', 'shields'],
  weapon_prof: ['simple', 'martial'],
  skill_choices: [
    'Animal Handling',
    'Athletics',
    'Intimidation',
    'Nature',
    'Perception',
    'Survival',
  ],
  num_skills: 2,
  equipment_choices: [
    'Greataxe | any_martial',
    '2 Handaxes | any_simple',
  ],
  equipment: ['4 Javelins', 'Explorer`s Pack'],
  wealth_die: 2,
  features: [
    'Rage: Advantage on STR checks and STR saves, Rage Damage bonus, resistance to bludgeoning, piercing and slashing damage. | Unarmored Defense: Without armor your AC is 10 + Dex modifier',
    'Reckless Attack: Advantage on your first melee STR attack roll and attacks against you until your next turn. | Danger Sense: Advantage on DEX saves against effects you can see. You can`t do this if you are blinded, deafened, or incapacitated.',
    'Primal Path: Choose a path that shapes the nature of your rage.',
    'ASI',
    'Extra Attack: You may attack twice whenever you take the Attack actin on your turn | Fast Movement: Your speed increases by 10 feet while you aren`t wearing heavy armor',
    'none',
    'Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren`t incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.',
    'ASI',
    'Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    'none',
    'Relentless Rage: If you drop to 0 hit points while raging and don`t die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.',
    'ASI',
    'Brutal Critical: You can roll two additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    'none',
    'Persistent Rage: Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.',
    'ASI',
    'Brutal Critical: You can roll three additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    'Indomitable Might: If your total for a Strength check is less than your Strength score, you may use that score instead',
    'none',
    'Primal Champion: Your STR and CON scores increase by 4, your maximum for those scores is now 24.',
  ],
)