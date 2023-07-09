# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Race.destroy_all
Subrace.destroy_all
PlayerClass.destroy_all
Subclass.destroy_all
Background.destroy_all
Feat.destroy_all
Character.destroy_all
Spell.destroy_all
ClassSpellList.destroy_all
ClassSpellListsSpells.destroy_all
Armor.destroy_all
Weapon.destroy_all
Equipment.destroy_all
Tool.destroy_all
Gearpack.destroy_all
EquipmentGearpack.destroy_all
GearpacksTool.destroy_all

User.create(
  email: "net@map.com",
  password: "netmap",
  password_confirmation: "netmap"
)

#if no subrace we need to apply a defuault one with no modifiers
BlankSubrace = Subrace.create(
  name: 'None',
  extra_languages: 0,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
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
  features: [
    'Napoleonic Vigor: Speed not reduced by heavy armor',
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Dwarven Resilience: Advantage on Poison saves and resistance to Poison damage.',
    'Stonecunning: Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.',
  ],
  sub_count: 2,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

DwarvenRace.subraces.create(
  name: 'Hill Dwarves',
  asi: [0,0,0,0,1,0],
  features: [
        'Dwarven Toughness: Your level is added to your hit point maximum.',
      ],
  extra_languages: 0,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'hp' => 'this.level',
  },
)

DwarvenRace.subraces.create(
  name: 'Mountain Dwarves',
  asi: [2,0,0,0,0,0],
  features: ['Dwarven Armor Training'],
  armor: ['Light','Medium'],
  extra_languages: 0,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

ElvenRace = Race.create(
  name: 'Elf',
  asi: [0,2,0,0,0,0],
  age_limit: 750,
  heightlow: "5'",
  heighthigh: "6'10''",
  languages: ['Common', 'Elvish'],
  speed: 30,
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Keen Senses: You have proficiency in Perception.',
    'Fey Ancestry: You have advantage on saving throws against being charmed, and can\'t be put to sleep magically.',
    'Trance: Elves don\'t need to sleep. Instead they meditate deeply for 4 hours a day.',
    ],
  skills: ['Perception'],
  sub_count: 3,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

ElvenRace.subraces.create(
  name: 'High Elf',
  asi: [0,0,0,1,0,0],
  features: [
    'Elven Weapon Training: You have proficiency with the longsword, shortsword, shortbow, and longbow.',
    'Cantrip: You know one cantrip of your choice from the Wizard spell list. Intelligence is your spellcasting stat for that spell.',
    'Extra Language: You can speak read, and write one extra language.',
  ],
  extra_languages: 1,
  extra_spells: {
    'Wizard'=> {
      'source'=> 'High Elf',
      'cantrips_choices'=> [
        [1,1]
      ],
      'spells_choices'=> 0,
      'spell_ability'=> 'Intelligence',
      'spells_are_extra'=> true,
    },
  },
  specific_spells: {},
  custom_mods: {},
)

ElvenRace.subraces.create(
  name: 'Wood Elf',
  asi: [0,0,0,0,1,0],
  features: [
    'Elven Weapon Training: You have proficiency with the longsword, shortsword, shortbow, and longbow',
    'Fleet of Foot: Your base walking speed increases to 35 feet.',
    'Mask of the Wild: You can attempt to hide even when you are onluy lightly obscured.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'speed' => '35',
  },
)

ElvenRace.subraces.create(
  name: 'Drow',
  asi: [0,0,0,0,0,1],
  features: [
    'Superior Darkvision: Your darkvision has a radius of 120 feet.',
    'Sunlight Sensitivity: You have disadvantage on attack rolls and on Wisdom(Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.',
    'Drow Magic: You know the dancing lights cantrip. When you reach 3rd level you can cast faerie fire once per long rest. At 5th level you can cast darkness once per long rest. Charisma is your spellcasting ability for these spells.',
    'Drow Weapon Training: You have proficiency with rapiers, shortswords, and hand crossbows.',
  ],
  weapons: ['Rapier','Shortsword','Hand Crossbow'],
  extra_spells: {},
  specific_spells: {
    1=> [['Dancing Lights', 'Cantrip']],
    3=> [['Faerie Fire', 'Long Rest']],
    5=> [['Darkness', 'Long Rest']],
    'stat'=> 'Charisma',
    'source'=> 'Drow',
  },
  custom_mods: {},
)

HalflingRace = Race.create(
  name: 'Halfling',
  asi: [0,2,0,0,0,0],
  age_limit: 250,
  heightlow: "3'",
  heighthigh: "4'",
  languages: ['Common', 'Halfling'],
  speed: 25,
  features: [
    'Lucky: When you roll a 1 on a d20 for an attack, ability check, or save, you can reroll the die and must use the new roll.',
    'Brave: You have advantage on saving throws against being frightened.',
    'Halfling Nimbleness: You can move through the space of any creature that is of a size larger than yours.',
  ],
  sub_count: 2,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalflingRace.subraces.create(
  name: 'Lightfoot',
  asi: [0,0,0,0,0,1],
  features: [
    'Naturally Stealthy: You can attempt to hide even when you are only obscured by a creature one size larger than you.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalflingRace.subraces.create(
  name: 'Stout',
  asi: [0,0,1,0,0,0],
  features: [
    'Stout Resilience: You have advantage on saving throws against poison, and you have resistance against poison damage.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HumanRace = Race.create(
  name: 'Human',
  asi: [1,1,1,1,1,1],
  age_limit: 90,
  heightlow: "5'",
  heighthigh: "6'6''",
  languages: ['Common'],
  extra_languages: 1,
  speed: 30,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

DragonbornRace = Race.create(
  name: 'Dragonborn',
  asi: [2,0,0,0,0,1],
  age_limit: 80,
  heightlow: "6'",
  heighthigh: "7'",
  languages: ['Common', 'Draconic'],
  speed: 30,
  features: [],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

DragonbornRace.subraces.create(
  name: 'Black Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Acid damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Acid damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Acid Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Acid',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Blue Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale arcs of lightning in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Lightning damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Lightning damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Lightning Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Lightning',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Brass Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Bronze Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale arcs of lightning in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Lightning damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Lightning damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Lightning Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Lightning',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Copper Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Acid damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Acid damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Acid Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Acid',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Gold Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale fire in a 15 foot cone. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Green Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale acrid poisonous spray in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Poison damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Poison damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Poison Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Poison',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Red Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching flames in a 15 foot cone. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Silver Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale withering cold in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Cold damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Cold damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Cold Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Cold',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'White Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale withering cold in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Cold damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Cold damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Cold Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Cold',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

GnomeRace = Race.create(
  name: 'Gnome',
  asi: [0,0,0,2,0,0],
  age_limit: 500,
  heightlow: "3'",
  heighthigh: "4'",
  languages: ['Common', 'Gnomish'],
  speed: 25,
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Gnome Cunning: You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.',
  ],
  sub_count: 2,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

GnomeRace.subraces.create(
  name: 'Forest Gnome',
  asi: [0,1,0,0,0,0],
  features: [
    'Illusionist: You know the minor illusion cantrip and cast it with Intelligence.',
    'Speak with Small Beasts: Through sounds and gestures you can communicate simple ideas with small or smaller beasts.',
  ],
  extra_spells: {},
  specific_spells: {
    1=> [['Minor Illusion','Cantrip']],
    'stat'=> 'Intelligence',
    'source'=> 'Forest Gnome',
  },
  custom_mods: {},
)

GnomeRace.subraces.create(
  name: 'Rock Gnome',
  asi: [0,0,1,0,0,0],
  features: [
    'Artificer\'s Lore: Whenever you make an Intelligence(History) check related to magic items, alchemical objects, or technological devices, you can add twice your proficiency bonus, instead of any proficiency bonus you would normally apply.',
    'Tinker: You have proficiency with Tinker\'s Tools. Using these tools, you can spend 1 hour and 10gp worth of materials to construct a Tiny clockwork device which ceases to function after 24 hours unless you spend 1 hour repairing it.',
  ],
  tools: ['Tinker\'s Tools'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalfElfRace = Race.create(
  name: 'Half Elf',
  asi: [0,0,0,0,0,2],
  age_limit: 200,
  heightlow: "5'",
  heighthigh: "6'",
  languages: ['Common','Elvish'],
  extra_languages: 1,
  speed: 30,
  features: [
    'Adaptable: Choose two ability scores to increase by one.',
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Fey Ancestry: You have advantage on saving throws against being charmed, and magic can\'t put you to sleep.',
    'Skill Versatility: You gain proficiency in two skills of your choice.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'extra_asi'=> 2,
    'extra_profs'=> [
      [1,2],
    ],
  },
)

HalfOrcRace = Race.create(
  name: 'Half Orc',
  asi: [2,0,1,0,0,0],
  age_limit: 80,
  heightlow: "5'",
  heighthigh: "7'",
  languages: ['Common', 'Orc'],
  speed: 30,
  skills: ['Intimidation'],
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Menacing: You have proficiency in Intimidation.',
    'Relentless Endurance: When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead once per long rest.',
    'Savage Attacks: When you score a critical hit with a melee weapon attack, you can roll one of the weapon\'s damage dice one additional time and add it to the extra damage.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

TieflingRace = Race.create(
  name: 'Tiefling',
  asi: [0,0,0,1,0,2],
  age_limit: 100,
  heightlow: "5'",
  heighthigh: "6'6''",
  languages: ['Common', 'Infernal'],
  speed: 30,
  skills: ['Intimidation'],
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Hellish Resistance: You have resistance to fire damage.',
    'Infernal Legacy: You know the thaumaturgy cantrip. At 3rd level, you can cast hellish rebuke as a 2nd level spell once per long rest. At 5th level you can cast darkness once per long rest. Charisma is your spellcasting ability for these spells.',
  ],
  extra_spells: {},
  specific_spells: {
    1=> [['Thaumaturgy','Cantrip']],
    3=> [['Hellish Rebuke','Long Rest']],
    5=> [['Darkness','Long Rest']],
    'stat'=> 'Charisma',
    'source'=> 'Infernal Legacy'
  },
  custom_mods: {},
)


Barbarian = PlayerClass.create(
  name: 'Barbarian',
  hit_die: 12,
  starting_hp: 12,
  primary_abilities: [0],
  saving_throws: [0,2],
  armor: ['Light', 'Medium', 'Shields'],
  weapons: ['Simple', 'Martial'],
  skill_choices: [
    'Animal Handling',
    'Athletics',
    'Intimidation',
    'Nature',
    'Perception',
    'Survival',
  ],
  num_skills: 2,
  equipment_choices: { #testing this format
    'choices'=>[
      ['martial#1','Greataxe#1'],
      ['simple#1','Handaxe#2'],
    ],
    'default'=>['Javelin#4', "Explorer's Pack#1"],
  },
  wealth_die: 2,
  features: {
    1=>[
      'Rage: Advantage on STR checks and STR saves, Rage Damage bonus, resistance to bludgeoning, piercing and slashing damage.',
      'Unarmored Defense: Without armor your AC is 10 + Dex modifier'
    ],
    2=>[
      'Reckless Attack: Advantage on your first melee STR attack roll and attacks against you until your next turn.',
      'Danger Sense: Advantage on DEX saves against effects you can see. You can`t do this if you are blinded, deafened, or incapacitated.'
    ],
    3=>['Primal Path: Choose a path that shapes the nature of your rage.'],
    4=>["Abiliity Score Increase:"],
    5=>['Extra Attack: You may attack twice whenever you take the Attack actin on your turn.',
       'Fast Movement: Your speed increases by 10 feet while you aren`t wearing heavy armor'
      ],
    7=>['Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren`t incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.'],
    8=>["Ability Score Increase:"],
    9=>['Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    11=>['Relentless Rage: If you drop to 0 hit points while raging and don`t die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.'],
    12=>["Ability Score Increase:"],
    13=>['Brutal Critical: You can roll two additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    15=>['Persistent Rage: Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.'],
    16=>["Ability Score Increase:"],
    17=>['Brutal Critical: You can roll three additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    18=>['Indomitable Might: If your total for a Strength check is less than your Strength score, you may use that score instead'],
    20=>['Primal Champion: Your STR and CON scores increase by 4, your maximum for those scores is now 24.'],
  },
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Barbarian.subclasses.create(
  name: "Berserker",
  features: {
    3=> ['Frenzy: You can go into a frenzy when you rage. If you do so, for the duration of your rage, you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.'],
    6=> ['Mindless Rage: You can`t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.'],
    10=> ['Intimidating Presence: You can use your action to frighten someone with your menacing presence. Choose one creature you can see within 30 feet, if it can see or hear you it must succeed on a WIS save with DC of 8 plus your proficiency bonus plus your CHA modifier, or be frightened of you until the end of your next turn. On subsequent turns you can use your action to extend this effect another turn. The effect ends if the creature ends its turn out of line of sight or more than 60 feet away. If they successfully save, you can`t use this on them again for 24 hours.'],
    14=> ['Retaliation: When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.']
  },
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Barbarian.subclasses.create(
  name: "Totem Warrior",
  features: {
    3=> ['Spirit Seeker: You gain the ability to cast Beast Sense and Speak With Animals as rituals.', 'Totem Spirit: Choose a totem spirit and acquire its feature. You must make or acquire a physical totem object that imcorporates fur or feathers, claws, teeth, or bones of the totem aniumal. At your option, you also gain minior physical attributes that are reminiscent of your totem spirit. For example, if you have a bear totem spirit, you might be unusually hairy and thick-skinned, or if your totem is the eagle, your eyes turn bright yellow. Your totem animal might be an animal related to those listed here but more appropriate to your homeland.'],
    6=> ['Aspect of the Beast: You gain a magical benefit based on the totem animal of your choice.'],
    10=> ['Spirit Walker: You can cast the Commune With Nature spell as a ritual. When you do, a spiritual version of one of your totem animals appears to you to convey the information you seek.'],
    14=> ['Totemic Attunement: You gain a magical benefit based on the totem animal of your choice.']
  },
  custom: {
    3=> [
      'Bear: While raging, you have resistance to all damage except psychic damage. The spirit of the bear makes you tough enough to stand up to any punishment.',
      'Eagle: While you`re ragina and aren`t wearing heavy armor, other creatures have disadvantage on opportunity attack rolls against you, and you can use the Dash action as a bonus action on your turn. The spirit of the eagle makes you into a predator who can weave through the gray with ease.',
      'Wolf: While you`re raging, your friends have advantage on melee attack rolls against any creature within 5 feet of you that is hostile to you. The spirit of the wolf makes you a leader of hunters.',
    ],
    6=> [
      'Bear: You gain the might of a bear. your carrying capacity is doubled, and you have advantage on STR checks made to push, pull, lift, or break objects.',
      'Eagle: You gain the eyesight of an eagle. you can see up to 1 mile away with no difficulty, able to discern even fine details as though looking at something no more than 100 feet away from you. Additionally, dim light doesn`t impose disadvantage on your Wisdom(Perception) checks.',
      'Wolf: You gain the hunting sensibilities of a wolf. You can track other creatures while traveling at a fast pace, and you can move stealthily while traveling at a normal pace.',
    ],
    14=> [
      'Bear: While you`re raging, any creature within 5 feet of you that`s hostile to you has disadvantage on attack rolls against targets other than you or another character with this feature. An enemy is immune to this effect if it can`t see or hear you or if it can`t be frightened.',
      'Eagle: While raging, you have a flying speed equal to your current walking speed. This benefit works only in short bursts; you fall if you end your turn in the air and nothing else is holding you aloft.',
      'Wolf: While you`re raging, you can use a bonus action on your turn to knock a Large or smaller creature prone when you hit it with meleee weapon attack.',
    ],
  },
  extra_spells: {},
  specific_spells: {
    3=>[['Beast Sense','Ritual'],['Speak With Animals','Ritual']],
    10=>[['Commune With Nature','Ritual']],
  },
  custom_mods: {},
)

Bard = PlayerClass.create(
  name: 'Bard',
  hit_die: 8,
  starting_hp: 8,
  primary_abilities: [5],
  saving_throws: [1,5],
  armor: ['Light'],
  weapons: ['Simple','Hand Crossbow','Longsword','Rapier','Shortsword'],
  tools: [],
  skill_choices: ['Acrobatics','Animal Handling','Arcana','Athletics','Deception','History','Insight','Intimidation','Investigation','Medicine','Nature','Perception','Performance','Persuasion','Religion','Sleight of Hand','Stealth','Survival'],
  num_skills: 3,
  equipment_choices: {
    'choices' => [
      ['Rapier#1','Longsword#1','simple#1'],
      ["Diplomat's Pack#1","Entertainer's Pack#1"],
      ['Lute#1','Bagpipes#1'],
    ],
    'default' => ['Leather Armor#1','Dagger#1'],
  },
  spellcasting_ability: 6,
  spell_table: [
    [4,2,2,0,0,0,0,0,0,0,0],
    [5,2,3,0,0,0,0,0,0,0,0],
    [6,2,4,2,0,0,0,0,0,0,0],
    [7,3,4,3,0,0,0,0,0,0,0],
    [8,3,4,3,2,0,0,0,0,0,0],
    [9,3,4,3,3,0,0,0,0,0,0],
    [10,3,4,3,3,1,0,0,0,0,0],
    [11,3,4,3,3,2,0,0,0,0,0],
    [12,3,4,3,3,3,1,0,0,0,0],
    [14,4,4,3,3,3,2,0,0,0,0],
    [15,4,4,3,3,3,2,1,0,0,0],
    [15,4,4,3,3,3,2,1,0,0,0],
    [16,4,4,3,3,3,2,1,1,0,0],
    [18,4,4,3,3,3,2,1,1,0,0],
    [19,4,4,3,3,3,2,1,1,1,0],
    [19,4,4,3,3,3,2,1,1,1,0],
    [20,4,4,3,3,3,2,1,1,1,1],
    [22,4,4,3,3,3,3,1,1,1,1],
    [22,4,4,3,3,3,3,2,1,1,1],
    [22,4,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire, magic that you can tune to different situations. Charisma is your Spellcasting Ability.",
      "Bardic Inspiration: You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6.
      Once within the next 10 minutes, the creature can roll the die and add it to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls before deciding to use the Bardic Inspiration die. Once it is rolled, it is lost and a creature can only have one Bardic Inspiration at a time.
      You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses after a long rest.
      The die becomes a d8 at 5th level, a d10 at 10th, and a d12 at 15th",
    ],
    2=>[
      "Jack of All Trades: You can add half your proficiency bonus, rounded down, to any ability check you make that doesn't already include your proficiency bonus.",
      "Song of Rest: You can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.
      The extra hit points increase to 1d8 at 9th level, 1d10 at 13th, and 1d12 at 17th.",
    ],
    3=>[
      "Bard College: You delve into the advanced techniques of the bard college of your choice.",
      "Expertise: Choose two of your skill proficiencies. Your proficiency bonus is doubled for these proficiencies when you make an ability check.
      At 10th level, you can choose another two proficiencies to gain this benefit.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Font of Inspiration: You regain all epended uses of Bardic Inspiration on a short or long rest."
    ],
    6=>[
      "Countercharm: You gain the ability to use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed. A creature must be able to hear you to gain this benefit. The performance ends early if you are incapacitated or silenced or if you voluntarily end it (no action required)."
    ],
    8=>[
      "Ability Score Increase:",
    ],
    10=>[
      "Magical Secrets: You have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip.
      The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.
      You learn two additional spells from any class at 14th, and 18th level."
    ],
    12=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Superior Inspiration: When you roll initiative and have no uses of Bardic Inspiration left, you regain one use."
    ],
  },
  custom: {
  },
  extra_spells: {
    'Any'=> {
      'source'=> 'Magical Secrets',
      'spells_choices'=> [
        [10,2],
        [14,2],
        [18,2], #2 spells each at 10, 14 and 18th level
      ],
      'cantrips_choices'=> 0,
      'spell_ability'=> 'Charisma',
      'spells_are_extra'=> false,
    }
  },
  specific_spells: {},
  custom_mods: {},
)

Bard.subclasses.create(
  name: "College of Lore",
  description: "Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales. Whether singing folk ballads in taverns or elaborate compositions in royal courts, these bards use their gifts to hold audiences spellbound.",
  features: {
    3=>[
      "Bonus Proficiencies: You gain 3 skill proficiencies of your choice.",
      "Cutting Words: You learn how to use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet of you makes an attack roll, an ability check, or a damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature's roll. You can choose to use this feature after the creature makes its roll, but before the DM determines whether the attack roll or ability check succeeds or fails, or before the creature deals its damage. The creature is immune if it can't hear you or if it's immune to being charmed.",
    ],
    6=>[
      "Magical Secrets: You learn two spells of your choice from any class. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you but don't count against the number of bard spells you know.",
    ],
    14=>[
      "Peerless Skill: When you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check. You can choose to do so after you roll the die for the ability check, but before the DM tells you whether you succeed or fail.",
    ],
  },
  custom: {},
  extra_spells: {
    'Any'=> {
      'source'=> 'College of Lore',
      'spells_choices'=> [
        [6,2], #2 choices at level 6
      ],
      'cantrips_choices'=> 0,
      'spell_ability'=> 'Charisma',
      'spells_are_extra'=> false,
    }
  },
  specific_spells: {},
  custom_mods: {
    'extra_profs'=> [
      [3,3],
    ]
  },
)

Bard.subclasses.create(
  name: "College of Valor",
  description: "Bards of the College of Valor are daring skalds whose tales keep alive the memory of the great heroes of the past, and thereby inspire a new generation of heroes. These bards gather in mead halls or around great bonfires to sing the deeds of the mighty, both past and present.",
  features: {
    3=>[
      "Bonus Proficiencies: You gain proficiency with medium armor, shields, and martial weapons.",
      "Combat Inspiration: You learn to inspire others in battle. A creature that has a Bardic Inspiration die from you can roll that die and add the number rolled to a weapon damage roll it just made. Alternatively, when an attack roll is made against the creature, it can use its reaction to roll the Bardic Inspiration die and add the number rolled to its AC against that attack, after seeing the roll but before knowing whether it hits or misses.",
    ],
    6=>[
      "Extra Attack: You can attack twice when you take the Attack action on your turn.",
    ],
    14=>[
      "Battle Magic: You have mastered the art of weaving spellcasting and weapon use into a single harmonious act. When you use your action to cast a bard spell, you can make one weapon attack as a bonus action.",
    ],
  },
  custom: {},
  armor: ['Medium','Shields'],
  weapons: ['Martial'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Cleric = PlayerClass.create(
  name: 'Cleric',
  hit_die: 8,
  starting_hp: 8,
  primary_abilities: [4],
  saving_throws: [4,5],
  armor: ['Light','Medium','Shields'],
  weapons: ['Simple'],
  tools: [],
  skill_choices: ['History','Insight','Medicine','Persuasion','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices' => [
      ['Mace#1','Warhammer#1'],
      ["Scale Mail#1","Leather Armor#1","Chain Mail#1"],
      ['Light Crossbow#1','simple#1'],
      ['Priest\'s Pack#1','Explorer\'s Pack#1'],
    ],
    'default' => ['Shield#1','Holy Emblem#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [-1,3,2,0,0,0,0,0,0,0,0],
    [-1,3,3,0,0,0,0,0,0,0,0],
    [-1,3,4,2,0,0,0,0,0,0,0],
    [-1,4,4,3,0,0,0,0,0,0,0],
    [-1,4,4,3,2,0,0,0,0,0,0],
    [-1,4,4,3,3,0,0,0,0,0,0],
    [-1,4,4,3,3,1,0,0,0,0,0],
    [-1,4,4,3,3,2,0,0,0,0,0],
    [-1,4,4,3,3,3,1,0,0,0,0],
    [-1,5,4,3,3,3,2,0,0,0,0],
    [-1,5,4,3,3,3,2,1,0,0,0],
    [-1,5,4,3,3,3,2,1,0,0,0],
    [-1,5,4,3,3,3,2,1,1,0,0],
    [-1,5,4,3,3,3,2,1,1,0,0],
    [-1,5,4,3,3,3,2,1,1,1,0],
    [-1,5,4,3,3,3,2,1,1,1,0],
    [-1,5,4,3,3,3,2,1,1,1,1],
    [-1,5,4,3,3,3,3,1,1,1,1],
    [-1,5,4,3,3,3,3,2,1,1,1],
    [-1,5,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: As a conduit for divine power you can cast Cleric spells. Wisdom is your Spellcasting Stat for these spells.",
      "Spellcasting Focus: You can use a holy symbol or consecrated item as a spellcasting focus for your cleric spells.",
    ],
    2=>[
      "Channel Divinity - Turn Undead: As an action, you present your holy symbol and speak a prayer censuring the undead. Each undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes any damage.
      A turned creature must spend its turns trying to move as far away from you as it can, and it can't willingly move to a space within 30 feet of you. It also can't take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there's nowhere to move, the creature can use the Dodge action.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Destroy Undead: Starting at 5th level, when an undead of CR 1/2 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed. The CR limit increases to 1 at 8th level, 2 at 11th, 3 at 14th, and 4 at 17th level."
    ],
    8=>[
      "Ability Score Increase:",
    ],
    10=>[
      "Divine Intervention: Beginning at 10th level, you can call on your deity to intervene on your behalf when your need is great.
      Imploring your deity's aid requires you to use your action. Describe the assistance you seek, and roll percentile dice. If you roll a number equal to or lower than your cleric level, your deity intervenes. The DM chooses the nature of the intervention; the effect of any cleric spell or cleric domain spell would be appropriate. If your deity intervenes, you can't use this feature again for 7 days. Otherwise, you can use it again after you finish a long rest.",
    ],
    12=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Command the Gods: Your call for Diving Intervention succeeds automatically.",
    ],
  },
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Knowledge Domain",
  description: "The gods of konwledge value learning and understanding above all. Followers of these gods study esoteric lore, collect old tomes, delve into the secret places of the earth, and learn all they can.",
  features: {
    1=>[
      "Blessings of Knowledge: You learn two languages, become proficient in 2 of Arcana, History, Nature, or Religion, and you have expertise in those skills.",
    ],
    2=>[
      "Knowledge of the Ages: You can use your Channel Divinity to tap into a divine well of knowledge. As an action, choose one skill or tool and you have proficiency with it for 10 minutes.",
    ],
    6=>[
      "Read Thoughts: You can use your Channel Divinity to read a creature's thoughts. You can then use your acces to its mind to command it.
      As an action, choose one creature that you can see within 60 feet of you. That creature must make a Wisdom saving throw. If the creature succeeds on the saving throw, you can't use this feature on it again until you finish a long rest.
      If the creature fails its save, you can read its surface thoughts (those foremost in its mind, reflecting its current emotions and what it is actively thinking about) when it is within 60 feet of you. This effect lasts for 1 minute.
      During that time, you can use your action to end this effect and cast the Suggestion spell on the creature without expending a spell slot. The target automatically fails its saving throw against the spell.",
    ],
    8=>[
      "Potent Spellcasting: You add your Wisdom modifier to the damage you deal with any cleric cantrip.",
    ],
    17=>[
      "Visions of the Past: You can call up visions of the past that relate to an object you hold or your immediate surroundings. You spend at least 1 minute in meditation and prayer, then receive dreamlike, shadowy glimpses of recent events. You can meditate in this way for a number of minutes equal to your Wisdom score and must maintain concentration during that time, as if you were casting a spell.
      Once you use this feature, you can't use it again until you finish a short or long rest."
    ],
  },
  custom: {},
  extra_spells: {},
  specific_spells: {
   1=>[['Command','Normal'],['Identify','Normal']],
   3=>[['Augury','Normal'],['Suggestion','Normal']],
   5=>[['Nondetection','Normal'],['Speak With the Dead','Normal']],
   7=>[['Arcane Eye','Normal'],['Confusion','Normal']],
   9=>[['Legend Lore','Normal'],['Scrying','Normal']],
  },
  custom_mods: {},
)

Druid = PlayerClass.create(
  name: 'Druid',
  hit_die: 8,
  starting_hp: 8,
  primary_abilities: [4],
  saving_throws: [1,4],
  armor: ['Light','Medium','SHields'],
  weapons: ['Club','Dagger','Dart','Javelin','Mace','Quarterstaff','Scimitar','Sickle','Sling','Spear'],
  tools: ['Herbalism Kit'],
  skill_choices: ['Arcana','Animal Handling','Insight','Medicine','Nature','Perception','Religion','Survival'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      ['Wooden Shield#1','simple#1'],
      ['Scimitar#1','simple#1'],
    ],
    'default'=>['Leather Armor','Explorer\'s Pack','Yew Wand#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [-1,2,2,0,0,0,0,0,0,0,0],
    [-1,2,3,0,0,0,0,0,0,0,0],
    [-1,2,4,2,0,0,0,0,0,0,0],
    [-1,3,4,3,0,0,0,0,0,0,0],
    [-1,3,4,3,2,0,0,0,0,0,0],
    [-1,3,4,3,3,0,0,0,0,0,0],
    [-1,3,4,3,3,1,0,0,0,0,0],
    [-1,3,4,3,3,2,0,0,0,0,0],
    [-1,3,4,3,3,3,1,0,0,0,0],
    [-1,4,4,3,3,3,2,0,0,0,0],
    [-1,4,4,3,3,3,2,1,0,0,0],
    [-1,4,4,3,3,3,2,1,0,0,0],
    [-1,4,4,3,3,3,2,1,1,0,0],
    [-1,4,4,3,3,3,2,1,1,0,0],
    [-1,4,4,3,3,3,2,1,1,1,0],
    [-1,4,4,3,3,3,2,1,1,1,0],
    [-1,4,4,3,3,3,2,1,1,1,1],
    [-1,4,4,3,3,3,3,1,1,1,1],
    [-1,4,4,3,3,3,3,2,1,1,1],
    [-1,4,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 2,
  features: {
    1=>[
      "Druidic: You know the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic.",
      "Spellcasting: Drawing on the divine essence of nature itself, you can cast spells to shape that essence to your will.",
      "Spellcasting Focus: You can use a druidic focus as a spellcasting focus for your druid spells."
    ],
    2=>[
      "Wild Shape: You can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or long rest.
      Your druid level determines the beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a challenge rating of 1/4 or lower that doesn't have a flying or swimming speed.
      You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a bonus action on your turn. You automatically revert if you fall unconscious, drop to 0 hit points, or die.",
    ],
    4=>[
      "Ability Score Increase:"
    ],
    8=>[
      "Ability Score Increase:",
    ],
    12=>[
      "Ability Score Increase:"
    ],
    16=>[
      "Ability Score Increase:"
    ],
    18=>[
      "Timeless Body: The primal magic that you wield causes you to age more slowly. For every 10 years that pass, your body ages only 1 year.",
      "Beast Spells: You can cast many of your druid spells in any shape you assume using Wild Shape. You can perform the somatic and verbal components of a druid spell while in a beast shape, but you aren't able to provide material components.",
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Archdruid: You can use your Wild Shape an unlimited number of times.
      Additionally, you can ignore the verbal and somatic components of your druid spells, as well as any material components that lack a cost and aren't consumed by a spell. You gain this benefit in both your normal shape and your beast shape from Wild Shape.",
    ],
  },
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Land",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Ymoving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'specific_spells_choices'=> [
      {
        name: 'Arctic',
        spells: {
          3=>["Hold Person","Spike Growth"],
          5=>["Sleet Storm","Slow"],
          7=>["Freedom of Movement","Ice Storm"],
          9=>["Commune With Nature","Cone of Cold"],
        }
      },
      {
        name: 'Coast',
        spells: {
          3=>["Mirror Image","Misty Step"],
          5=>["Water Breathing","Water Walk"],
          7=>["Control Water","Freedom of Movement"],
          9=>["Conjure Elemental","Scrying"],
        }
      },
       {
        name: 'Desert',
        spells: {
          3=>["Blur","Silence"],
          5=>["Create Food and Water","Protection from Energy"],
          7=>["Blight","Hallucinatory Terrain"],
          9=>["Insect Plague","Wall of Stone"],
        }
      },
       {
        name: 'Forest',
        spells: {
          3=>["Barkskin","Spider Climb"],
          5=>["Call Lightning","Plant Growth"],
          7=>["Divination","Freedom of Movement"],
          9=>["Dream","Insect Plague"],
        }
      },
    ]
  },
)

Fighter = PlayerClass.create(
  name: 'Fighter',
  hit_die: 10,
  starting_hp: 10,
  primary_abilities: [0,2],
  saving_throws: [0,2],
  armor: ['Light','Medium','Heavy','Shields'],
  weapons: ['Simple','Martial'],
  tools: [],
  skill_choices: ['Acrobatics','Animal Handling','Athletics','History','Insight','Intimidation','Perception','Survival'],
  num_skills: 2,
  equipment_choices: {
    'choices'=> [
      ['Chain Mail#1',['Leather Armor#1','Longbow#1','Arrows#1']],
      [['martial#1','Round Shield'],'martial#2'],
      [['Light Crossbow#1','Bolts#1'],'Handaxe#2'],
      ['Dungeoneer\'s Pack#1','Explorer\'s Pack#1'],
    ],
    'default'=> [],
  },
  wealth_die: 5,
  features: {
    1=> [
      "Second Wind: You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again.",
    ],
    2=> [
      "Action Surge: You can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action.
      Once you use this feature, you must finish a short or long rest before you can use it again.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Extra Attack: You can attack twice when you take the attack action on your turn.",
    ],
    6=>[
      "Ability Score Increase:",
    ],
    8=>[
      "Ability Score Increase:",
    ],
    9=>[
      "Indomitable: You can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can’t use this feature again until you finish a long rest.",
    ],
    11=>[
      "Extra Attack: You can now attack three times when you take the attack action on your turn.",
    ],
    12=>[
      "Ability Score Increase:",
    ],
    13=>[
      "Indefatigable: You can use your Indomitable feature twice between long rests.",
    ],
    14=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    17=> [
      "Improved Action Surge: You can use your Action Surge twice before your rest, but only once per turn.",
      "Indeclinable: You can use your Indomitable feature three times between long rests.",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Tetra-Strike: You can attack four times when you take the Attack action on your turn.",
    ],
  },
  custom: {
    1=> [
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ],
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
  spellcasting_ability: 0,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
)

Fighter.subclasses.create(
  name: "Champion",
  description: "The archetypal Champion focuses on the development of raw physical power honed to deadly perfection. Those who model themselves on this archetype combine rigorous training with physical excellence to deal devastating blows.",
  custom: {
    10=>[
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ],
  },
  features: {
    1=> [
      "Improved Critical: Your weapon attacks score a critical hit on a roll of 19 or 20.",
    ],
    7=> [
      "Remarkable Athlete: You can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn’t already use your proficiency bonus.
      In addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier.",
    ],
    10=> [
      "Fighting Style: You may choose a second option from the Fighting Style class feature.",
    ],
    15=> [
      "Superior Critical: Your weapon attacks score a critical hit on a roll of 18 or higher.",
    ],
    18=> [
      "Survivor: You attain the pinnacle of resilience in battle. At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don’t gain this benefit if you have 0 hit points.",
    ]
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Monk = PlayerClass.create(
  name: 'Monk',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [0,1],
  armor: [],
  weapons: ['Simple','Shortsword'],
  skill_choices: ['Acrobatics','Athletics','History','Insight','Religion','Stealth'],
  num_skills: 2,
  wealth_die: 0,
  equipment_choices: {
    'choices'=>[
      ['Shortsword#1','simple#1'],
      ['DUngeoneer\'s Pack#1','Explorer\'s Pack']
    ],
    'default'=> ['Darts#1']
  },
  features: {
    1=>[
      "Unarmored Defense: While you have no armor equipped, your AC is 10 + your Dexterity modifier + your Wisdom modifier.",
    ],
  },
  custom: {},
  custom_mods: {
    'tool_choice'=>[
      ['artisan','instrument'],
    ],
    'martial_die'=>[
      4,4,4,4,6,6,6,6,6,6,8,8,8,8,8,8,10,10,10,10
    ],
    'unarmored_movement'=>[
      0,10,10,10,10,15,15,15,15,20,20,20,20,25,25,25,25,30,30,30
    ],
  },
  spellcasting_ability: 0,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
  extra_spells: {},
  specific_spells: {},
)

Ranger = PlayerClass.create(
  name: 'Ranger',
  hit_die: 10,
  starting_hp: 10,
  primary_abilities: [1,4],
  saving_throws: [0,1],
  armor: ['Light','Medium','Shields'],
  weapons: ['Simple','Martial'],
  tools: [],
  skill_choices: ['Animal Handling','Athletics','Insight','Investigation','Nature','Perception','Stealth','Survival'],
  num_skills: 3,
  equipment_choices: {
    'choices'=>[
      ['Scale Mail#1','Leather Armor#1'],
      ['Shortsword#2','simple#2'],
      ["Dungeoneer's Pack#1","Explorer's Pack#1"],
    ],
    'default'=>['Longbow#1','Quiver#1','Arrows#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [2,0,2,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Favored Enemy: You have significant experience studying, tracking, hunting, and even talking to a certain type of enemy.
      Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select; celestials and fiends, or oozes and plants, or two races of humanoid (such as gnolls and orcs) as favored enemies.
      You have advantage on Wisdom checks involving your favored enemies and on Intelligence checks to recall information about them.
      You also have gain a +2 bonus to damage with weapon attacks, which increases to +3 at 6th level, and +4 at 14th level.
      When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level.
      At 10th level you may select to replace the favored enemy you selected at 1st level, though you do not gain a language for this shift.",
      "Natural Explorer: You are adept at traveling and surviving in the wilderness and particularly familiar with one type of natural environment. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, swamp, or the Underdark. When you make an Intelligence (Investigation, Nature) or Wisdom (Animal Handling, Perception, Survival) check while in your related to your favored terrain, your proficiency bonus is doubled if you are using one of those skill that you're proficient in, or you add half your proficiency bonus (rounded down) if you are not proficient. While traveling for an hour or more in your favored terrain, you gain the following benefits:

      Difficult terrain doesn't slow your group's travel.
      Your group can't become lost except by magical means.
      Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger.
      If you are traveling alone, you can move stealthily at a normal pace.
      When you forage, you find twice as much food as you normally would.
      While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area.
      You may choose an additional favoured terrain At 5th, 10th & 15th level."
    ],
    2=>[
      "Fighting Styles: You adopt a particular fighting style as your specialty. If you choose another fighting style later on, you can't take a Fighting Style more than once.",
      "Spellcasting: You have learned to use the magical essence of nature to cast spells."
    ],
    3=>[
      "Ranger Archetype: Choose an archetype that you strive to emulate. Your choice grants you features at 3rd, 7th, 11th and 15th level.",
      "Primeval Awareness: You can use your action and expend one ranger spell slot to focus your awareness on the region around you.
      For one minute per level of the spell slot you expend, you can sense whether the following types of creatures are present within 1 mile of you (or within up to 6 miles if you are in your favored terrain): aberrations, celestials, dragons, elementals, fey, fiends, and undead. This feature doesn't reveal the creatures' location or number."
    ],
    4=>[
      "Ability Score Increase:"
    ],
    5=>[
      "Extra Attack: You can attack twice whenever you take the Attack action on your turn."
    ],
    8=>[
      "Ability Score Increase:",
      "Land's Stride: Moving through nonmagical difficult terrain coss you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement."
    ],
    10=>[
      "Hide in Plain Sight: You can spend 1 minute creating camouflage for yourself. You must have access to fresh mud, dirt, plants, soot, and other naturally occurring materials with which to create your camouflage.
      Once you are camouflaged in this way, you can try to hide by pressing yourself up against a solid surface, such as a tree or wall, that is at least as tall and wide as you are. You gain a +10 bonus to Dexterity(Stealth) checks as long as you remain there without moving or taking actions. Once you move or take an action or a reaction, you must camouflage yourself again to gain this benefit."
    ],
    12=>[
      "Ability Score Increase:"
    ],
    14=>[
      "Vanish: You can use the Hide action as a bonus action on your turn. Also, you can't be tracked by nonmagical means, unless you choose to leave a trail."
    ],
    16=>[
      "Ability Score Increase:"
    ],
    18=>[
      "Feral Sense: You gain preternatural senses that help you fight creatures you can't see. When you attack a creature you can't see, your inability to see it doesn't impose disadvantage on your attack rolls against it.
      You are also aware of the location of any invisible creature within 30 feet of you, provided that the creature isn't hidden from you and you aren't blinded or deafened."
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Foe Slayer: You become an unparalleled hunter of your enemies. Once on each of your turns, you can add your Wisdom modifier to the attack roll or the damage roll of an attack you make against one of your favored enemies. You can choose to use this feature before or after the roll, but before any effects of the roll are applied."
    ]
  },
  custom: {
    2=>[
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ]
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Ranger.subclasses.create(
  name: "Hunter",
  description: "Emulating the Hunter archetype means accepting your place as a bulwark between civilization and the terrors of the wilderness. As you walk the Hunter's path, you learn specialized techniques for fighting the threats you face, from rampaging ogres and hordes of orcs to towering giants and terrifying dragons.",
  custom: {
    3=>[
      "Colossus Slayer: Your tenacity can wear down the most potent foes. When you hit a creaure wih a weapon attack, the creature akes an exra 1d8 damage if it's below its hit point maximum. You can deal this extra damage only oce per turn.",
      "Giant Killer: When a Large or larger creature within 5 feet of you hits or misses you with an attck, you can use your reaction to attack that creature immediately after its attack, provided that you can see the creature.",
      "Horde Breaker: Once on each of your turns when you make a weapon attack, you can make another attack with the same weapon against a different creature that is within 5 feet of the original target and within range of your weapon."
    ],
    7=>[
      "Escape the Horde: Opportunity attacks against you are made with disadvantage.",
      "Multiattack Defense: When a creature hits you with an attack, you gain a +4 bonus to AC against all subsequent attacks made by that creature for the rest of the turn.",
      "Steel Will: You have the advantage on saving throws against being frightened.",
    ],
    11=>[
      "Volley: You can use your action to make a ranged attack against any number of creatures within 10 feet of a point you can see within your weapon's range. You must have ammunition for each target, as normal, and you make a separate attack roll for each target.",
      "Whirlwind Attack: You can use your action to make a melee attack against any numnber of creatures within 5 feet of you, with a separate attack roll for each target.",
    ],
    15=>[
      "Evasion: When you are subjected to an effect, such as a red dragon's fiery breath or a lightning bolt spell, that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.",
      "Stand Against the Tide: When a hostile creature misses you with a melee attack, you can use your reaction to force that creature to repeat the same attack against another creature (other than itself) of your choice.",
      "Uncanny Dodge: When an attacker that you can see hits you with an attackm you can use your reaction to halve the attack's damage against you.",
    ]
  },
  features: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Ranger.subclasses.create(
  name: "Beast Master",
  description: "The Beast Master embodies a friendship between the civilized races and the beasts of the wild. United in focus, beast and ranger fight the monsters that threaten civilization and the wilderness alike.",
  features: {
    3=>["You gain a beast companion that accompanies you on your adventures and is trained to fight alongside you. Choose a beast that is no larger than Medium and that has a challenge rating of 1/4 or lower (appendix D presents statistics for the hawk, mastiff, and panther as examples). Add your proficiency bonus to the beast’s AC, attack rolls, and damage rolls, as well as to any saving throws and skills it is proficient in. Its hit point maximum equals its normal maximum or four times your ranger level, whichever is higher. Like any creature, the beast can spend Hit Dice during a short rest.
    The beast obeys your commands as best as it can. It takes its turn on your initiative. On your turn, you can verbally command the beast where to move (no action required by you). You can use your action to verbally command it to take the Attack, Dash, Disengage, or Help action. If you don’t issue a command, the beast takes the Dodge action. Once you have the Extra Attack feature, you can make one weapon attack yourself when you command the beast to take the Attack action. While traveling through your favored terrain with only the beast, you can move stealthily at a normal pace.
    If you are incapacitated or absent, the beast acts on its own, focusing on protecting you and itself. The beast never requires your command to use its reaction, such as when making an opportunity attack.
    If the beast dies, you can obtain another one by spending 8 hours magically bonding with another beast that isn’t hostile to you, either the same type of beast as before or a different one."],
    7=>["On any of your turns when your beast companion doesn't attack, you can use a bonus action to command the beast to take the Dash, Disengage, DOdge, or Help action on its turn."],
    11=>["When you command your beast companion to take the Attack action, the beast can make two attcks, or it can take the Multiattack action if it has that action."],
    15=>["When you cast a spell targeting yourself, you can also affect your beast companion with the spell if the beast is within 30 feet of you."],
    },
  custom: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Acolyte = Background.create(
  name: "Acolyte",
  description: 'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  skills: ['Insight', 'Religion'],
  extra_languages: 2,
  equipment_choices: {
    'choices'=>[],
    'default'=>[
      'Holy Emblem#1',
      'Prayer Book#1',
      'Incense#5',
      'Clothes, sacred vestments#1',
      'Clothes, common#1'
    ],
  },
  gold: 15,
  traits: [
    'I idolize a particular hero of my faith, and constantly refer to that person`s deeds and example.',
    'I can find common ground between the fiercest enemies, empathizing with them and always working toward peace.',
    'I see omens in every event and action. The gods try to speak to us, we just need to listen.',
    'Nothing can shake my optimistic attitude.',
    'I quote (or misquote) sacred texts and proverbs in almost every situation.',
    'I am tolerant (or intolerant) of other faiths and respect (or condemn) the worship of other gods.',
    'I’ve enjoyed fine food, drink, and high society among my temple’s elite. Rough living grates on me.',
    'I’ve spent so long in the temple that I have little practical experience dealing with people in the outside world.',
  ],
  ideals: [
    'Tradition. The ancient traditions of worship and sacrifice must be preserved and upheld. (Lawful)',
    'Charity. I always try to help those in need, no matter what the personal cost. (Good)',
    'Change. We must help bring about the changes the gods are constantly working in the world. (Chaotic)',
    'Power. I hope to one day rise to the top of my faith’s religious hierarchy. (Lawful)',
    'Faith. I trust that my deity will guide my actions. I have faith that if I work hard, things will go well. (Lawful)',
    'Aspiration. I seek to prove myself worthy of my god’s favor by matching my actions against his or her teachings. (Any)',
  ],
  bonds: [
    'I would die to recover an ancient relic of my faith that was lost long ago.',
    'I will someday get revenge on the corrupt temple hierarchy who branded me a heretic.',
    'I owe my life to the priest who took me in when my parents died.',
    'Everything I do is for the common people.',
    'I will do anything to protect the temple where I served.',
    'I seek to preserve a sacred text that my enemies consider heretical and seek to destroy.',
  ],
  flaws: [
    'I judge others harshly, and myself even more severely.',
    'I put too much trust in those who wield power within my temple’s hierarchy.',
    'My piety sometimes leads me to blindly trust those that profess faith in my god.',
    'I am inflexible in my thinking.',
    'I am suspicious of strangers and expect the worst of them.',
    'Once I pick a goal, I become obsessed with it to the detriment of everything else in my life.',
  ],
  features: [
      'Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.',
    ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Feat_alert = Feat.create(
  name: 'Alert',
  description: 'Always on the lookout for danger, you won`t be fooled by just anyone.',
  features: [
      'You gain +5 to initiative.',
      'You can`t be surprised while you are conscious.',
      'Other creatures don`t gain advantage on attack rolls against you as a result of being unseen by you.'
    ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

bard = Array[](5,6,9,23,24,30,33,37,43,45,50,52,59,60,62,83,85,86)
cleric = Array[](2,8,11,18,19,24,26,28,30,32,34,37,43,50,55,56,65,72,75,76,79,80,81,85)
druid = Array[](5,6,7,10,12,23,27,29,35,42,45,57,62,63,66,67,68,70,72,75,76,80,85)
paladin = Array[](2,20,21,22,25,26,34,36,40,49,55,58,79,84,85)
ranger = Array[](3,5,6,27,29,57,63,64,69,70,77,85)
sorceror = Array[](1,4,9,14,26,33,35,37,38,39,41,44,45,46,47,48,50,52,53,54,59,61,62,78,82,83,86)
warlock = Array[](14,16,17,18,26,33,35,45,46,48,52,59,67,71,78,81,83)
wizard = Array[](1,3,4,8,9,11,12,13,14,15,18,26,30,31,33,35,37,38,39,41,44,45,46,47,48,50,51,52,53,54,59,61,62,66,68,71,73,75,76,78,81,82,83,86)

Bard_list = ClassSpellList.create( name: 'Bard' )
Cleric_list = ClassSpellList.create( name: 'Cleric' )
Druid_list = ClassSpellList.create( name: 'Druid' )
Pal_list = ClassSpellList.create( name: 'Paladin' )
Ran_list = ClassSpellList.create( name: 'Ranger' )
Sorc_list = ClassSpellList.create( name: 'Sorceror' )
War_list = ClassSpellList.create( name: 'Warlock' )
Wiz_list = ClassSpellList.create( name: 'Wizard' )

ClassSpellListsSpells.create(
  class_spell_list_id: Ranger_list.id,
  spell_id: 1
)

Spell.create(
  name: 'Acid Splash',
  description: 'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage.',
  school: 'conjuration',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d6',
    5=> '2d6',
    11=> '3d6',
    17=> '4d6',
  },
  dmg_type: 'Acid',
  id: 1,
)

Spell.create(
  name: 'Aid',
  level: 2,
  description: 'Your spell bolsters your allies with toughness and resolve. Choose up to three creatures within range. Each target’s hit point maximum and current hit points increase by 5 for the duration.

  At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, a target’s hit points increase by an additional 5 for each slot level above 2nd.',
  school: 'abjuration',
  range: '30 feet',
  components: ['V','S','M (a tiny strip of white cloth)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  id: 2,
)

Spell.create(
  name: 'Alarm',
  level: 1,
  description: "You set an alarm against unwanted intrusion. Choose a door, a window, or an area within range that is no larger than a 20-foot cube. Until the spell ends, an alarm alerts you whenever a Tiny or larger creature touches or enters the warded area. When you cast the spell, you can designate creatures that won't set off the alarm. You also choose whether the alarm is mental or audible.
    A mental alarm alerts you with a ping in your mind if you are within 1 mile of the warded area. This ping awakens you if you are sleeping.
    An audible alarm produces the sound of a hand bell for 10 seconds within 60 feet
    ",
  ritual: 1,
  school: 'abjuration',
  cast_time: '1 minute',
  range: '30 feet',
  components: ['V','S','M (a tiny bell and a piece of fine silver wire)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 3,
)

Spell.create(
  name: 'Alter Self',
  level: 2,
  description: "You assume a different form. When you cast the spell, choose one of the following options, the effects of which last for the duration of the spell. While the spell lasts, you can end one option as an action to gain the benefits of a different one.

  Aquatic Adaptation: You adapt your body to an aquatic environment, sprouting gills, and growing webbing between your fingers. You can breathe underwater and gain a swimming speed equal to your walking speed.

  Change Appearance: You transform your appearance. You decide what you look like, including your height, weight, facial features, sound of your voice, hair length, coloration, and distinguishing characteristics, if any. You can make yourself appear as a member of another race, though none of your statistics change. You also don't appear as a creature of a different size than you, and your basic shape stays the same, if you're bipedal, you can't use this spell to become quadrupedal, for instance. At any time for the duration of the spell, you can use your action to change your appearance in this way again.

  Natural Weapons: You grow claws, fangs, spines, horns, or a different natural weapon of your choice. Your unarmed strikes deal 1d6 bludgeoning, piercing, or slashing damage, as appropriate to the natural weapon you chose, and you are proficient with your unarmed strikes. Finally, the natural weapon is magic and you have a +1 bonus to the attack and damage rolls you make using it.",
  school: 'transmutation',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 4,
)

Spell.create(
  name: 'Animal Friendship',
  level: 1,
  description: "This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast’s Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a Wisdom saving throw or be charmed by you for the spell’s duration. If you or one of your companions harms the target, the spells ends.

  At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional beast for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a moresel of food)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 5,
)

Spell.create(
  name: 'Animal Messenger',
  level: 2,
  description: "By means of this spell, you use an animal to deliver a message. Choose a Tiny beast you can see within range, such as a squirrel, a blue ray, or a bird. You specify a location, which you must have visited, and a recipient who matches a general description, such as a man or woman dressed in the uniform of the town guard or a red-haired dwarf wearing a pointed hat. You also speak a message of up to twenty-five words. The target beast travels for the duration of the spell towards the specified location, covering about 50 miles per 24 hours for a flying messenger or 25 miles for other animals.

  When the messenger arrives, it delivers your message to the creature that you described, replicating the sound of your voice. The messenger speaks only to a creature matching the description you gave. If the messenger doesn't reach its destination before the spell ends, the message is lost, and the beast makes its way back to where you cast this spell.

  At Higher Levels: If you cast this spell using a spell slot of 3rd level or higher, the duration of the spell increases by 48 hours for each slot level above 2nd.",
  school: 'enchantment',
  ritual: 1,
  range: '30 feet',
  components: ['V','S','M (a morsel of food)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 6,
)

Spell.create(
  name: 'Animal Shapes',
  level: 8,
  description: "Your magic turns others into beasts. Choose any number of willing creatures that you can see within range. You transform each target into the form of a large or smaller beast with a challenge rating of 4 or lower. On subsequent turns, you can use your actions to transform affected creatures into new forms.

The transformation lasts for the duration for each target, or until the target drops to 0 hit points or dies. You can choose a different form for each target. A target's game statistics are replaced by the statistics of the chosen beast, though the target retains its alignment and Intelligence, Wisdom, and Charisma scores. The target assumes the hit points of its new form, and when it reverts to its normal form, it returns to the number of hit point it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn't reduce the creature's normal form to 0 hit points, it isn't knocked unconscious. The creature is limited in the actions it can perform by the nature of its new form, and it can't speak or cast spells.

The target's gear melds into the new form. The target can't activate, wield, or otherwise benefit from any of its equipment.",
  school: 'transmutation',
  range: '30 feet',
  duration: 'Concentration, up to 24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 7,
)

Spell.create(
  name: 'Animate Dead',
  level: 3,
  description: "This spell creates an undead servant. Choose a pile of bones or a corpse of a Medium or Small humanoid within range. Your spell imbues the target with a foul mimicry of life, raising it as an undead creature. The target becomes a skeleton if you chose bones or a zombie if you chose a corpse (the DM has the creature's game statistics).

On each of your turns, you can use a bonus action to mentally command any creature you made with this spell if the creature is within 60 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

The creature is under your control for 24 hours, after which it stops obeying any command you've given it. To maintain the control of the creature for another 24 hours, you must cast this spell on the creature again before the current 24-hour period ends. This use of the spell reasserts your control over up to four creatures you have animated with this spell, rather than animating a new one.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, you animate or reassert control over two additional undead creatures for each slot above 3rd. Each of the creatures must come from a different corpse or pile of bones.",
  school: 'necromancy',
  cast_time: '1 minute',
  range: '10 feet',
  components: ['V','S','M (a drop of blood, a piece of flesh, and a pinch of bone dust)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 8,
)

Spell.create(
  name: 'Animate Objects',
  level: 5,
  description: "Objects come to life at your command. Choose up to ten nonmagical objects within range that are not being worn or carried. Medium targets count as two objects, Large targets count as four objects, Huge targets count as eight objects. You can't animate any object larger than Huge. Each target animates and becomes a creature under your control until the spell ends or until reduced to 0 hit points.

As a bonus action, you can mentally command any creature you made with this spell if the creature is within 500 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

At Higher Levels: If you cast this spell using a spell slot of 6th level or higher, you can animate two additional objects for each slot level above 5th.",
  school: 'transmutation',
  range: '120 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 9,
)

Spell.create(
  name: 'Antilife Shell',
  level: 5,
  description: "A shimmering barrier extends out from you in a 10-foot radius and moves with you, remaining centered on you and hedging out creatures other than undead and constructs.

The barrier lasts for the duration. The barrier prevents an affected creature from passing or reaching through. An affected creature can cast spells or make attacks with ranged or reach weapons through the barrier.

If you move so that an affect creature is forced to pass through the barrier, the spell ends.",
  school: 'abjuration',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 10,
)

Spell.create(
  name: 'Antimagic Field',
  level: 8,
  description: "A 10-foot-radius invisible sphere of antimagic surrounds you. This area is divorced from the magical energy that suffuses the multiverse. Within the sphere, spells can't be cast, summoned creatures disappear, and even magic items become mundane. Until the spell ends, the sphere moves with you, centered on you.

Spells and other magical effects, except those created by an artifact or a deity, are suppressed in the sphere and can't protrude into it. A slot expended to cast a suppressed spell is consumed. While an effect is suppressed, it doesn't function, but the time it spends suppressed counts against its duration.",
  school: 'abjuration',
  components: ['V','S','M (a piunch of powdered iron or iron filings)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 11,
)

Spell.create(
  name: 'Antipathy/Sympathy',
  level: 8,
  description: "This spell attracts or repels creatures of your choice. You target something within range, either a Huge or smaller object or creature or an area that is no larger than a 200-foot cube. Then specify a kind of intelligent creature, such as red dragons, goblins, or vampires. You invest the target with an aura that either attracts or repels the specified creatures for the duration. Choose antipathy or sympathy as the aura's effect.",
  school: 'enchantment',
  cast_time: '1 hour',
  range: '60 feet',
  components: ['V','S','M (either a lump of alum soaked in vinegar for antipathy, or a drop of honey for sympathy)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 12,
)

Spell.create(
  name: 'Arcane Eye',
  level: 4,
  description: "You create an invisible, magical eye within range that hovers in the air for the duration.

You mentally receive visual information from the eye, which has normal vision and darkvision out to 30 feet. The eye can look in every direction.

As an action, you can move the eye up to 30 feet in any direction. There is no limit to how far away from you the eye can move, but it can't enter another plane of existence. A solid barrier blocks the eye's movement, but the eye can pass through an opening as small as 1 inch in diameter.",
  school: 'divination',
  range: '30 feet',
  components: ['V','S','M (a bit of bat fur)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 13,
)

Spell.create(
  name: 'Arcane Gate',
  level: 6,
  description: "You create linked teleportation portals that remain open for the duration. Choose two points on the ground that you can see, one point within 10 feet of you and one point within 500 feet of you. A circular portal, 10 feet in diameter, opens over each point. If the portal would open in the space occupied by a creature, the spell fails, and the casting is lost.

The portals are two-dimensional glowing rings filled with mist, hovering inches from the ground and perpendicular to it at the points you choose. A ring is visible only from one side (your choice), which is the side that functions as a portal.

Any creature or object entering the portal exits from the other portal as if the two were adjacent to each other; passing through a portal from the nonportal side has no effect. The mist that fills each portal is opaque and blocks vision through it. On your turn, you can rotate the rings as a bonus action so that the active side faces in a different direction.",
  school: 'conjuration',
  range: '500 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 14,
)

Spell.create(
  name: 'Arcane Lock',
  level: 2,
  description: "You touch a closed door, window, gate, chest, or other entryway, and it becomes locked for the duration. You and the creatures you designate when you cast this spell can open the object normally. You can also set a password that, when spoken within 5 feet of the object, suppresses this spell for 1 minute. Otherwise, it is impassable until it is broken or the spell is dispelled or suppressed. Casting knock on the object suppresses arcane lock for 10 minutes.

While affected by this spell, the object is more difficult to break or force open; the DC to break it or pick any locks on it increases by 10.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (gold dust worth at least 25gp)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 15,
)

Spell.create(
  name: 'Armor of Agathys',
  level: 1,
  description: "A protective magical force surrounds you, manifesting as a spectral frost that covers you and your gear. You gain 5 temporary hit points for the duration. If a creature hits you with a melee attack while you have these hit points, the creature takes 5 cold damage.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, both the temporary hit points and the cold damage increase by 5 for each slot.",
  school: 'abjuration',
  components: ['V','S','M (a cup of water)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 16,
)

Spell.create(
  name: 'Arms of Hadar',
  level: 1,
  description: "",
  school: 'conjuration',
  attack: 'true',
  atk_dmg: {
    1=> '2d6',
  },
  dmg_type: 'Necrotic',
  id: 17,
)

Spell.create(
  name: 'Astral Projection',
  level: 9,
  description: "You and up to eight willing creatures within range project your astral bodies into the Astral Plane (the spell fails and the casting is wasted if you are already on that plane). The material body you leave behind is unconscious and in a state of suspended animation, it doesn't need food or air and doesn't age.

Your astral body resembles your mortal form in almost every way, replicating your game statistics and possessions. The principal difference is the addition of a silvery cord that extends from between your shoulder blades and trails behind you, fading to invisibility after 1 foot. This cord is your tether to your material body. As long as the tether remains intact, you can find your way home. If the cord is cut-something that can happen only when an effect specifically states that it does-your soul and body are separated, killing you instantly.
",
  school: 'necromancy',
  cast_time: '1 hour',
  range: '10 feet',
  components: ['V','S','M (for each creature you affect with this spell, you must provide one jacinth worth at least 1,000 gp and one ornately carved bar of silver worth at least 100gp, all of which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 18,
)

Spell.create(
  name: 'Augury',
  level: 2,
  description: "By casting gem-inlaid sticks, rolling dragon bones, laying out ornate cards, or employing some other divining tool, you receive an omen from an otherworldly entity about the results of a specific course of action that you plan to take within the next 30 minutes.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V','S','M (specially marked sticks, bones, or other tokens worth at least 25gp)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 19,
)

Spell.create(
  name: 'Aura of Life',
  level: 4,
  description: "Life-preserving energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. Each non-hostile creature in the aura (including you) has resistance to necrotic damage, and its hit point maximum can’t be reduced. In addition, a non-hostile, living creature regains 1 hit point when it starts its turn in the aura with 0 hit points.",
  school: 'abjuration',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 20,
)

Spell.create(
  name: 'Aura of Purity',
  level: 4,
  description: "Purifying energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. Each non-hostile creature in the aura (including you) can’t become diseased, has resistance to poison damage, and has advantage on saving throws against effects that cause any of the following conditions: blinded, charmed, deafened, frightened, paralyzed, poisoned, and stunned.",
  school: 'abjuration',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 21,
)

Spell.create(
  name: 'Aura of Vitality',
  level: 4,
  description: "Healing energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. You can use a bonus action to cause one creature in the aura (including you) to regain 2d6 hit points.",
  school: 'evocation',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 22,
)

Spell.create(
  name: 'Awaken',
  level: 5,
  description: "After spending the casting time tracing magical pathways within a precious gemstone, you touch a huge or smaller beast or plant. The target must have either no Intelligence score or an Intelligence of 3 or less. The target gains an Intelligence of 10. The target also gains the ability to speak one language you know. If the target is a plant, it gains the ability to move its limbs, roots, vines, creepers, and so forth, and it gains senses similar to a human's. Your DM chooses statistics appropriate for the awakened plant, such as the statistics for the awakened shrub or the awakened tree.

The awakened beast or plant is charmed by you for 30 days or until you and your companions do anything harmful to it. When the charmed condition ends, the awakened creature chooses whether to remain friendly to you, based on how you treated it while it was charmed.",
  school: 'transmutation',
  cast_time: '8 hours',
  range: 'Touch',
  components: ['V','S','M (an agate worth at least 1,000 gp which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 23,
)

Spell.create(
  name: 'Bane',
  level: 1,
  description: "Up to three creatures of your choice that you can see within range must make Charisma saving throw. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a drop of blood)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 24,
)

Spell.create(
  name: 'Banishing Smite',
  level: 5,
  description: "The next time you hit a creature with a weapon attack before this spell ends, your weapon crackles with force, and the attack deals an extra 5d10 force damage to the target. Additionally, if this attack reduces the target to 50 hit points of fewer, you banish it. If the target is native to a different plane of existence than the on you’re on, the target disappears, returning to its home plane. If the target is native to the plane you’re on, the creature vanishes into a harmless demiplane. While there, the target is incapacitated. It remains there until the spell ends, at which point the target reappears in the space it left or in the nearest unoccupied space if that space is occupied.",
  school: 'abjuration',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 25,
)

Spell.create(
  name: 'Banishment',
  level: 4,
  description: "You attempt to send one creature that you can see within range to another plane of existence. The target must succeed on a Charisma saving throw or be banished.

If the target is native to the plane of existence you're on, you banish the target to a harmless demiplane. While there, the target is incapacitated. The target remains there until the spell ends, at which point the target reappears in the space it left or in the nearest unoccupied space if that space is occupied.

If the target is native to a different plane of existence that the one you're on, the target is banished with a faint popping noise, returning to its home plane. If the spell ends before 1 minute has passed, the target reappears in the space it left or in the nearest unoccupied space if that space is occupied. Otherwise, the target doesn't return.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, you can target one additional creature for each slot level above 4th.",
  school: 'abjuration',
  range: '60 feet',
  components: ['V','S','M (an item distasteful to the target)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 26,
)

Spell.create(
  name: 'Barkskin',
  level: 2,
  description: "You touch a willing creature. Until the spell ends, the target's skin has a rough, bark-like appearance, and the target's AC can't be less than 16, regardless of what kind of armor it is wearing.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a handful of oak bark)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false'.
  atk_dmg: {},
  dmg_type: '',
  id: 27,
)

Spell.create(
  name: 'Beacon of Hope',
  level: 3,
  description: "This spell bestows hope and vitality. Choose any number of creatures within range. For the duration, each target has advantage on Wisdom saving throws and death saving throws, and regains the maximum number of hit points possible from any healing.",
  school: 'abjuration',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 28,
)

Spell.create(
  name: 'Beast Sense',
  level: 3,
  description: "You touch a willing beast. For the duration of the spell, you can use your action to see through the beast’s eyes and hear what it hears, and continue to do so until you use your action to return to your normal senses.",
  school: 'abjuration',
  ritual: 1,
  range: 'Touch',
  components: ['S'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 29,
)

Spell.create(
  name: 'Bestow Curse',
  level: 3,
  description: "You touch a creature, and that creature must succeed on a Wisdom saving throw or become cursed for the duration of the spell. When you cast this spell, choose the nature of the curse from the following options.

• Choose one ability score. While cursed, the target has disadvantage on ability checks and saving throws made with that ability score.

• While cursed, the target has disadvantage on attack rolls against you.

• While cursed, the target must make a Wisdom saving throw at the start of each of its turns. If it fails, it wastes its action that turn doing nothing.

• While the target is cursed, your attacks and spells deal an extra 1d8 necrotic damage to the target.

A remove curse spell ends this effect. At the DM's option, you may choose an alternative curse effect, but it should be no more powerful than those described above. The DM has final say on such a curse's effect.

At Higher Levels: If you cast this spell using a spell slot of 4th level or higher, the duration is concentration, up to 10 minutes. If you use a spell slot of 5th level or higher, the duration is 8 hours. If you use a spell slot of 7th level or higher, the duration is 24 hours. If you use a 9th level spell slot, the spell lasts until it is dispelled. Using a spell slot of 5th level or higher grants a duration that doesn't require concentration.",
  school: 'necromancy',
  range: 'Touch',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 30,
)

Spell.create(
  name: 'Bigby\'s Hand',
  level: 5,
  description: "You create a Large hand of shimmering, translucent force in an unoccupied space that you can see within range. The hand lasts for the spell’s duration, and it moves at your command, mimicking the movements of your own hand.

The hand is an object that has AC 20 and hit points equal to your hit point maximum. If it drops to 0 hit points, the spell ends. It has a Strength of 26 (+8) and a Dexterity of 10 (+0). The hand doesn’t fill its space.

When you cast the spell and as a bonus action on your subsequent turns, you can move the hand up to 60 feet and then cause one of the following effects with it: Forceful Hand, Grasping Hand, Interposing Hand.

At Higher Levels. When you cast this spell using a spell slot of 6th level or higher, the damage from the clenched fist option increases by 2d8 and the damage from the grasping hand increases by 2d6 for each slot level above 5th.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S','M (an eggshell and a snakeskin glove)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 31,
)

Spell.create(
  name: 'Blade Barrier',
  level: 6,
  description: "You create a vertical wall of whirling, razor-sharp blades made of magical energy. The wall appears within range and lasts for the duration. You can make a straight wall up to 100 feet long, 20 feet high, and 5 feet thick, or a ringed wall up to 60 feet in diameter, 20 feet high, and 5 feet thick. The wall provides three-quarters cover to creatures behind it, and its space is difficult terrain.

When a creature enters the wall's area for the first time on a turn or starts its turn there, the creature must make a Dexterity saving throw. On a failed save, the creature takes 6d10 slashing damage. On a successful save, the creature takes half as much damage.",
  school: 'evocation',
  range: '90 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 32,
)

Spell.create(
  name: 'Blade Ward',
  level: 0,
  description: "You extend your hand and trace a sigil of warding in the air. Until the end of your next turn, you have resistance against bludgeoning, piercing, and slashing damage dealt by weapon attacks.",
  school: 'abjuration',
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 33,
)

Spell.create(
  name: 'Bless',
  level: 1,
  description: "You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a sprinkling of holy water)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 34,
)

Spell.create(
  name: 'Blight',
  level: 4,
  description: "Necromantic energy washes over a creature of your choice that you can see within range, draining moisture and vitality from it. The target must make a Constitution saving throw. The target takes 8d8 necrotic damage on a failed save, or half as much damage on a successful one. This spell has no effect on undead or constructs.

If you target a plant creature or a magical plant, it makes the saving throw with disadvantage, and the spell deals maximum damage to it.

If you target a nonmagical plant that isn't a creature, such as a tree or shrub, it doesn't make a saving throw, it simply withers and dies.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d8 for each slot level above 4th.",
  school: 'necromancy',
  range: '30 feet',
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Necrotic',
  id: 35,
)

Spell.create(
  name: 'Blinding Smite',
  level: 3,
  description: "The next time you hit a creature with a melee weapon attack during this spell’s duration, you weapon flares with a bright light, and the attack deals an extra 3d8 radiant damage to the target. Additionally, the target must succeed on a Constitution saving throw or be blinded until the spell ends.

A creature blinded by this spell makes another Constitution saving throw at the end of each of its turns. On a successful save, it is no longer blinded.",
  school: 'evocation',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 36,
)

Spell.create(
  name: 'Blindness/Deafness',
  level: 2,
  description: "You can blind or deafen a foe. Choose one creature that you can see within range to make a Constitution saving throw. If it fails, the target is either blinded or deafened (your choice) for the duration. At the end of each of its turns, the target can make a Constitution saving throw. On a success, the spell ends.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.",
  school: 'necromancy',
  range: '30 feet',
  components: ['V'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 37,
)

Spell.create(
  name: 'Blink',
  level: 3,
  description: "Roll a d20 at the end of each of your turns for the duration of the spell. On a roll of 11 or higher, you vanish from your current plane of existence and appear in the Ethereal Plane (the spell fails and the casting is wasted if you were already on that plane). At the start of you next turn, and when the spell ends if you are on the Ethereal Plane, you return to an unoccupied space of your choice that you can see within 10 feet of the space you vanished from. If no unoccupied space is available within that range, you appear in the nearest unoccupied space (chosen at random if more than one space is equally near). You can dismiss this spell as an action.

While on the Ethereal Plane, you can see and hear the plane you originated from, which is cast in shades of gray, and you can't see anything more than 60 feet away. You can only affect and be affected by other creatures on the Ethereal Plane. Creature that aren't there can't perceive you or interact with you, unless they have the ability to do so.",
  school: 'transmutation',
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 38,
)

Spell.create(
  name: 'Blur',
  level: 2,
  description: "Your body becomes blurred, shifting and wavering to all who can see you. For the duration, any creature has disadvantage on attack rolls against you. An attacker is immune to this effect if it doesn’t rely on sight, as with blindsight, or can see through illusions, as with truesight.",
  school: 'illusion',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 39,
)

Spell.create(
  name: 'Branding Smite',
  level: 2,
  description: "The next time you hit a creature with a weapon attack before this spell ends, the weapon gleams with astral radiance as you strike. The attack deals an extra 2d6 radiant damage to the target, which becomes visible if it's invisible, and the target sheds dim light in a 5-foot radius and can't become invisible until the spell ends.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the extra damage increases by 1d6 for each slot level above 2nd.",
  school: 'evocation',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 40,
)

Spell.create(
  name: 'Burning Hands',
  level: 1,
  description: "As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one.

The fire ignites any flammable objects in the area that aren't being worn or carried.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  school: 'evocation',
  range: 'Self (15-foot cone)',
  attack: 'true',
  atk_dmg: {
    1=> '3d6',
  },
  dmg_type: 'Fire',
  id: 41,
)

Spell.create(
  name: 'Call Lightning',
  level: 3,
  description: "A storm cloud appears in the shape of a cylinder that is 10 feet tall with a 60-foot radius, centered on a point you can see 100 feet directly above you. The spell fails if you can't see a point in the air where the storm cloud could appear (for example, if you are in a room that can't accommodate the cloud).

When you cast the spell, choose a point you can see within range. A bolt of lightning flashes down from the cloud to that point. Each creature within 5 feet of that point must make a Dexterity saving throw. A creature takes 3d10 lightning damage  on a failed save, or half as much damage on a successful one. On each of your turns until the spell ends, you can use your action to call down lightning in this way again, targeting the same point or a different one.

If you are outdoors in stormy conditions when you cast this spell, the spell gives you control over the existing storm instead of creating a new one. Under such conditions, the spell's damage increases by 1d10.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher level, the damage increases by 1d10 for each slot level above 3rd.",
  school: 'conjuration',
  range: '120 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '3d10',
  },
  dmg_type: 'Lightning',
  id: 42,
)

Spell.create(
  name: 'Calm Emotions',
  level: 2,
  description: "You attempt to suppress strong emotions in a group of people. Each humanoid in a 20-foot-radius sphere centered on a point you choose within range must make a Charisma saving throw; a creature can choose to fail this saving throw if it wishes. If a creature fails its saving throw, choose one of the following two effects.

You can suppress any effect causing a target to be charmed or frightened. When this spell ends, any suppressed effect resumes, provided that its duration has not expired in the meantime.

Alternatively, you can make a target indifferent about creatures of your choice that it is hostile toward. This indifference ends if the target is attacked or harmed by a spell or if it witnesses any of its friends being harmed. When the spell ends, the creature becomes hostile again, unless the DM rules otherwise.",
  school: 'enchantment',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 43,
)

Spell.create(
  name: 'Chain Lightning',
  level: 6,
  description: "You create a bolt of lightning that arcs toward a target of your choice that you can see within range. Three bolts then leap from that target to as many as three other targets, each of which must be within 30 feet of the first target. A target can be a creature or an object and can be targeted by only one of the bolts.

A target must make a Dexterity saving throw. The target takes 10d8 lightning damage on a failed save, or half as much on a successful one.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, one additional bolt leaps from the first target to another target for each slot level above 6th.",
  school: 'evocation',
  range: '150 feet',
  components: ['V','S','M (a bit of fur, a piece of amber, a crystal rod, and three silver pins))'],
  attack: 'true',
  atk_dmg: {
    1=> '10d8',
  },
  dmg_type: 'Lightning',
  id: 44,
)

Spell.create(
  name: 'Charm Person',
  level: 1,
  description: "You attempt to charm a humanoid you can see within range. It must make a Wisdom saving throw, and does so with advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly acquaintance. When the spell ends, the creature knows it was charmed by you.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '30 feet',
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 45,
)

Spell.create(
  name: 'Chill Touch',
  level: 0,
  description: "You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can't regain hit points until the start of your next turn. Until then, the hand clings to the target.

If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn.

This spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'necromancy',
  range: '120 feet',
  duration: '1 round',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
  },
  dmg_type: 'Necrotic',
  id: 46,
)

Spell.create(
  name: 'Chromatic Orb',
  level: 1,
  description: "You hurl a 4-inch-diameter sphere of energy at a creature that you can see within range. You choose acid, cold, fire, lightning, poison, or thunder for the type of orb you create, and then make a ranged spell attack against the target. If the attack hits, the creature takes 3d8 damage of the type you chose.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  school: 'evocation',
  range: '90 feet',
  components: ['V','S','M (a diamond worth at least 50 gp)'],
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Elemental',
  id: 47,
)

Spell.create(
  name: 'Circle of Death',
  level: 6,
  description: "A sphere of negative energy ripples out in a 60-foot-radius sphere from a point within range. Each creature in that area must make a Constitution saving throw. A target takes 8d6 necrotic damage on a failed save, or half as much damage on a successful one.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the damage increases by 2d6 for each slot level above 6th.",
  school: 'necromancy',
  range: '150 feet',
  components: ['V','S','M (the powder of a crushed black pearl worth at least 500 gp)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d6',
  },
  dmg_type: 'Necrotic',
  id: 48,
)

Spell.create(
  name: 'Circle of Power',
  level: 5,
  description: "Divine energy radiates from you, distorting and diffusing magical energy within 30 feet of you. Until the spell ends, the sphere moves with you, centered on you. For the duration, each friendly creature in the area (including you) has advantage on saving throws against spells and other magical effects.

Additionally, when an affected creature succeeds on a saving throw made against a spell or magical effect that allows it to make a saving throw to take only half damage, it instead takes no damage if it succeeds on the saving throws.",
  school: 'abjuration',
  range: 'Self (30-foot radius)',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 49,
)

Spell.create(
  name: 'Clairvoyance',
  level: 3,
  description: "You create an invisible sensor within range in a location familiar to you (a place you have visited or seen before) or in an obvious location that is unfamiliar to you (such as behind a door, around a corner, or in a grove of trees). The sensor remains in place for the duration, and it can't be attacked or otherwise interacted with.

When you cast the spell, you choose seeing or hearing. You can use the chosen sense through the sensor as if you were in its space. As your action, you can switch between seeing and hearing.

A creature that can see the sensor (such as a creature benefitting from see invisibility or truesight) sees a luminous, intangible orb about the size of your fist.",
  school: 'divination',
  cast_time: '10 minutes',
  range: '1 mile',
  components: ['V','S','M (a focus worth at least 100 gp, either a jeweled horn for hearing or a glass eye for seeing)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 50,
)

Spell.create(
  name: 'Clone',
  level: 8,
  description: "This spell grows an inert duplicate of a living creature as a safeguard against death. This clone forms inside a sealed vessel and grows to full size and maturity after 120 days; you can also choose to have the clone be a younger version of the same creature. It remains inert and endures indefinitely, as long as its vessel remains undisturbed.
At any time after the clone matures, if the original creature dies, its soul transfers to the clone, provided that the soul is free and willing to return. The clone is physically identical to the original and has the same personality, memories, and abilities, but none of the original’s equipment. The original creature’s physical remains, if they still exist, become inert and can’t thereafter be restored to life, since the creature’s soul is elsewhere.",
  school: 'necromancy',
  cast_time: '1 hour',
  range: 'Touch',
  components: ['V','S','M (A diamond worth at least 1,000 gp and at least 1 cubic inch of flesh of the creature that is to be cloned, which the spell consumes, and a vessel worth at least 2,000 gp that has a sealable lid and is large enough to hold a Medium creature, such as a huge urn, coffin, mud-filled cyst in the ground, or crystal container filled with salt water)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 51,
)

Spell.create(
  name: 'Cloud of Daggers',
  level: 2,
  description: "You fill the air with spinning daggers in a cube 5 feet on each side, centered on a point you choose within range. A creature takes 4d4 slashing damage when it enters the spell’s area for the first time on a turn or starts its turn there.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 2d4 for each slot level above 2nd.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (a sliver of glass)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 52,
)

Spell.create(
  name: 'Cloudkill',
  level: 5,
  description: "You create a 20-foot-radius sphere of poisonous, yellow-green fog centered on a point you choose within range. The fog spreads around corners. It lasts for the duration or until strong wind disperses the fog, ending the spell. Its area is heavily obscured.

When a creature enters the spell's area for the first time on a turn or starts its turn there, that creature must make a Constitution saving throw. The creature takes 5d8 poison damage on a failed save, or half as much damage on a successful one. Creatures are affected even if they hold their breath or don't need to breathe.

The fog moves 10 feet away from you at the start of each of your turns, rolling along the surface of the ground. The vapors, being heavier than air, sink to the lowest level of the land, even pouring down openings.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.",
  school: 'conjuration',
  range: '120 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 53,
)

Spell.create(
  name: 'Color Spray',
  level: 1,
  description: "A dazzling array of flashing, colored light springs from your hand. Roll 6d10, the total is how many hit points of creatures this spell can effect. Creatures in a 15-foot cone originating from you are affected in ascending order of their current hit points (ignoring unconscious creatures and creatures that can't see).

Starting with the creature that has the lowest current hit points, each creature affected by this spell is blinded until the spell ends. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for the creature to be affected.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d10 for each slot level above 1st.",
  school: 'illusion',
  range: 'Self (15-foot cone)',
  components: ['V','S','M (a pinch of powder or sand that is colored red, yellow, and blue)'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 54,
)

Spell.create(
  name: 'Command',
  level: 1,
  description: "You speak a one-word command to a creature you can see within range. The target must succeed on a Wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn't understand your language, or if your command is directly harmful to it.

  At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 55,
)

Spell.create(
  name: 'Commune',
  level: 5,
  description: "You contact your deity or a divine proxy and ask up to three questions that can be answered with a yes or no. You must ask your questions before the spell ends. You receive a correct answer for each question.

Divine beings aren't necessarily omniscient, so you might receive "unclear" as an answer if a question pertains to information that lies beyond the deity's knowledge. In a case where a one-word answer could be misleading or contrary to the deity's interests, the DM might offer a short phrase as an answer instead.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V','S','M (incense and a vial of holy or unholy water)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 56,
)

Spell.create(
  name: 'Commune with Nature',
  level: 5,
  description: "You briefly become one with nature and gain knowledge of the surrounding territory. In the outdoors, the spell gives you knowledge of the land within 3 miles of you. In caves and other natural underground settings, the radius is limited to 300 feet. The spell doesn't function where nature has been replaced by construction, such as in dungeons and towns.

You instantly gain knowledge of up to three facts of your choice about any of the following subjects as they relate to the area - terrain and bodies of water; prevalent plants, minerals, animals, or peoples; powerful celestials, fey, fiends, elementals, or undead; influence from other planes of existence; buildings.",
  school: 'divination',
  cast_time: '1 minute',
  attack: 'false',
  dmg_type: '',
  id: 57,
)

Spell.create(
  name: 'Compelled Duel',
  level: 1,
  description: "You attempt to compel a creature into a duel. One creature that you can see within range must make a Wisdom saving throw. On a failed save, the creature is drawn to you, compelled by your divine demand. For the duration, it has disadvantage on attack rolls against creatures other than you, and must make a Wisdom saving throw each time it attempts to move to a space that is more than 30 feet away from you; if it succeeds on this saving throw, this spell doesn’t restrict the target’s movement for that turn.

The spell ends if you attack any other creature, if you cast a spell that targets a hostile creature other than the target, if a creature friendly to you damages the target or casts a harmful spell on it, or if you end your turn more than 30 feet away from the target.",
  school: 'enchantment',
  cast_time: '1 bonus action',
  range: '30 feet',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 58,
)

Spell.create(
  name: 'Comprehend Languages',
  level: 1,
  description: "For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text.

This spell doesn’t decode secret messages in a text or a glyph, such as an arcane sigil, that isn’t part of a written language.",
  school: 'divination',
  ritual: 1,
  components: ['V','S','M (a pinch of salt)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 59,
)

Spell.create(
  name: 'Compulsion',
  level: 4,
  description: "Creatures of your choice that you can see within range and that can hear you must make a Wisdom saving throw. A target automatically succeeds on this saving throw if it can't be charmed. On a failed save, a target is affected by this spell. Until the spell ends, you can use a bonus action on each of your turns to designate a direction that is horizontal to you. Each affected target must use as much of its movement as possible to move in that direction on its next turn. It can take its action before it moves. After moving in this way, it can make another Wisdom saving to try to end the effect. A target isn't compelled to move into an obviously deadly hazard, such as a fire or pit, but it will provoke opportunity attacks to move in the designated direction.",
  school: 'enchantment',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 60,
)

Spell.create(
  name: 'Cone of Cold',
  level: 5,
  description: "A blast of cold air erupts from your hands. Each creature in a 60-foot cone must make a Constitution saving throw. A creature takes 8d8 cold damage on a failed save, or half as much damage on a successful one.

A creature killed by this spell becomes a frozen statue until it thaws.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.",
  school: 'evocation',
  range: 'Self (60-foot cone)',
  components: ['V','S','M (a small crystal or glass cone)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Cold',
  id: 61,
)

Spell.create(
  name: 'Confusion',
  level: 4,
  description: "This spell assaults and twists creatures' minds, spawning delusions and provoking uncontrolled actions. Each creature in a 10-foot-radius sphere centered on a point you choose within range must succeed on a Wisdom saving throw when you cast this spell or be affected by it.

An affected target can't take reactions and must roll a d10 at the start of each of its turns to determine its behavior for that turn.

1: The creature uses all its movement to move in a random direction. To determine the direction, roll a d8 and assign a direction to each die face. The creature doesn't take an action this turn.

2-6: The creature doesn't move or take actions this turn.

7-8: The creature uses its action to make a melee attack against a randomly determined creature within its reach. If there is no creature within its reach, the creature does nothing this turn.

9-10: The creature can act and move normally.

At the end of its turns, an affected target can make a Wisdom saving throw. If it succeeds, this effect ends for that target.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the radius of the sphere increases by 5 feet for each slot above 4th.",
  school: 'enchantment',
  range: '90 feet',
  components: ['V','S','M (three nut shells)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 62,
)

Spell.create(
  name: 'Conjure Animals',
  level: 3,
  description: "You summon fey spirits that take the form of beasts and appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears.

• One beast of challenge rating 2 or lower

• Two beasts of challenge rating 1 or lower

• Four beasts of challenge rating 1/2 or lower

• Eight beasts of challenge rating 1/4 or lower

Each beast is also considered fey, and it disappears when it drops to 0 hit points or when the spell ends.

The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 5th-level slot, three times as many with a 7th-level slot, and four times as many with a 9th-level slot.",
  school: 'conjuration',
  range: '60 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 63,
)

Spell.create(
  name: 'Conjure Barrage',
  level: 3,
  description: "You throw a nonmagical weapon or fire a piece of nonmagical ammunition into the air to create a cone of identical weapons that shoot forward and then disappear. Each creature in a 60-foot cone must succeed on a Dexterity saving throw. A creature takes 3d8 damage on a failed save, or half as much damage on a successful one. The damage type is the same as that of the weapon or ammunition used as a component.",
  school: 'conjuration',
  range: 'Self (60-foot cone)',
  components: ['V','S','M (one piece of ammunition or a thrown weapon)'],
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Spell',
  id: 64,
)

Spell.create(
  name: 'Conjure Celestial',
  level: 7,
  description: "You summon a celestial of challenge rating 4 or lower, which appears in an unoccupied space that you can see within range. The celestial disappears when it drops to 0 hit points or when the spell ends.

The celestial is friendly to you and your companions for the duration. Roll initiative for the celestial, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don't violate its alignment. If you don't issue any commands to the celestial, it defends itself from hostile creatures but otherwise takes no actions The DM has the celestial's statistics.

At Higher Levels: When you cast this spell using a 9th-level spell slot, you summon a celestial of challenge rating 5 or lower.",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 65,
)

Spell.create(
  name: 'Conjure Elemental',
  level: 5,
  description: "You call forth an elemental servant. Choose an area of air, earth, fire, or water that fills a 10-foot cube within range. An elemental of challenge rating 5 or lower appropriate to the area you chose appears in an unoccupied space within 10 feet of it. For example, a fire elemental emerges from a bonfire, and an earth elemental rises up from the ground. The elemental disappears when it drops to 0 hit points or when the spell ends.

The elemental is friendly to you and your companions for the duration. Roll initiative for the elemental, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you). If you don't issue any commands to the elemental, it defends itself from hostile creatures but otherwise takes no actions.

If your concentration is broken, the elemental doesn't disappear. Instead, you lose control of the elemental, it becomes hostile toward you and your companions, and it might attack. An uncontrolled elemental can't be dismissed by you, and it disappears 1 hour after you summoned it. The DM has the elemental's statistics.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the challenge rating increases by 1 for each slot level above 5th.",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  components: ['V','S','M (burning incense for air, soft clay for earth, sulfure and phosphorus for fire, or water and sand for water)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 66,
)

Spell.create(
  name: 'Conjure Fey',
  level: 6,
  description: "You summon a fey creature of challenge rating 6 or lower, or a fey spirit that takes the form of a beast of challenge rating 6 or lower. It appears in an unoccupied space that you can see within range. The fey creature disappears when it drops to 0 hit points or when the spell ends.

The fey creature is friendly to you and your companions for the duration. Roll initiative for the creature, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don't violate its alignment. If you don't issue any commands to the fey creature, it defends itself from hostile creatures but otherwise takes no actions.

If your concentration is broken, the fey creature doesn't disappear. Instead, you lose control of the fey creature, it becomes hostile toward you and your companions, and it might attack. An uncontrolled fey creature can't be dismissed by you, and it disappears 1 hour after you summoned it. The DM has the fey creature's statistics.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the challenge rating increases by 1 for each slot level above 6th.",
  school: 'conjuration',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 67,
)

Spell.create(
  name: 'Conjure Minor Elementals',
  level: 4,
  description: "You summon elementals that appear in unoccupied spaces that you can see within range. You choose one the following options for what appears.

• One elemental of challenge rating 2 or lower

• Two elementals of challenge rating 1 or lower

• Four elementals of challenge rating 1/2 or lower

• Eight elementals of challenge rating 1/4 or lower.

An elemental summoned by this spell disappears when it drops to 0 hit points or when the spell ends.

The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 6th-level slot and three times as many with an 8th-level slot",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 68,
)

Spell.create(
  name: 'Conjure Volley',
  level: 5,
  description: "You fire a piece of nonmagical ammunition from a ranged weapon or throw a nonmagical weapon into the air and choose a point within range. Hundreds of duplicates of the ammunition or weapon fall in a volley from above and then disappear. Each creature in a 40-foot-radius, 20-foot-high cylinder centered on that point must make a Dexterity saving throw. A creature takes 8d8 damage on a failed save, or half as much damage on a successful one. The damage type is the same as that of the ammunition or weapon.",
  school: 'conjuration',
  range: '150 feet',
  components: ['V','S','M (one piece of ammunition or one thrown weapon)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Weapon',
  id: 69,
)

Spell.create(
  name: 'Conjure Woodland Beings',
  level: 4,
  description: "You summon fey creatures that appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears.

• One fey creature of challenge rating 2 or lower

• Two fey creatures of challenge rating 1 or lower

• Four fey creatures of challenge rating 1/2 or lower

• Eight fey creatures of challenge rating 1/4 or lower

A summoned creature disappears when it drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which have their own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 6th-level slot and three times as many with an 8th-level slot.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (one holly berry per creature summoned)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 70,
)

Spell.create(
  name: 'Contact Other Plane',
  level: 5,
  description: "You mentally contact a demigod, the spirit of a long-dead sage, or some other mysterious entity from another plane. Contacting this extraplanar intelligence can strain or even break your mind. When you cast this spell, make a DC 15 Intelligence saving throw. On a failure, you take 6d6 psychic damage and are insane until you finish a long rest. While insane, you can't take actions, can't understand what other creatures say, can't read, and speak only in gibberish. A greater restoration spell cast on you ends this effect.

On a successful save, you can ask the entity up to five questions. You must ask your questions before the spell ends. The DM answers each question with one word, such as yes, no, maybe, never, irrelevant, unclear (if the entity doesn't know the answer to the question). If a one-word answer would be misleading, the DM might instead offer a short phrase as an answer.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 71,
)

Spell.create(
  name: 'Contagion',
  level: 5,
  description: "Your touch inflicts disease. Make a melee spell attack against a creature within your reach. On a hit, you afflict the creature with a disease of your choice from any of the ones described below.

At the end of each of the target's turns, it must make a Constitution saving throw. After failing three of these saving throws, the disease's effects last for the duration, and the creature stops making these saves. After succeeding on three of these saving throws, the creature recovers from the disease, and the spell ends.

Since this spell induces a natural disease in its target, any effect that removes a disease or otherwise ameliorates a disease's effects apply to it.

Blinding Sickness: Pain grips the creature's mind, and its eyes turn milky white. The creature has disadvantage on Wisdom checks and Wisdom saving throws and is blinded.

Filth Fever: A raging fever sweeps through the creature's body. The creature has disadvantage on Strength checks, Strength saving throws, and attack rolls that use Strength.

Flesh Rot: The creature's flesh decays. The creature has disadvantage on Charisma checks and vulnerability to all damage.

Mindfire: The creature's mind becomes feverish. The creature has disadvantage on Intelligence checks and Intelligence saving throws, and the creature behaves as if under the effects of the confusion spell during combat.

Seizure: The creature is overcome with shaking. The creature has disadvantage on Dexterity checks, Dexterity saving throws, and attack rolls that use Dexterity.

Slimy Doom: The creature begins to bleed uncontrollably. The creature has disadvantage on Constitution checks and Constitution saving throws. In addition, whenever the creature takes damage, it is stunned until the end of its next turn.",
  school: 'necromancy',
  range: 'Touch',
  duration: '7 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 72,
)

Spell.create(
  name: 'Contingency',
  level: 6,
  description: "Choose a spell of or lower that you can cast, that has a casting time of 1 action, and that can target you. You cast that spell, called the contingent spell, as part of casting contingency, expending spell slots for both, but the contingent spell doesn't come into effect. Instead, it takes effect when a certain circumstance occurs. You describe that circumstance when you cast the two spells. For example, a contingency cast with water breathing might stipulate that water breathing comes into effect when you are engulfed in water or a similar liquid.

The contingent spell takes effect immediately after the circumstance is met for the first time, whether or not you want it to, and then contingency ends.

The contingent spell takes effect only on you, even if it can normally target others. You can use only one contingency spell at a time. If you cast this spell again, the effect of another contingency spell on you ends. Also, contingency ends on you if its material component is ever not on your person.",
  school: 'evocation',
  cast_time: '10 minutes',
  components: ['V','S','M (a statuette of youreslf carved from ivory and dcorated with gems worth at least 1,500 gp)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 73,
)

Spell.create(
  name: 'Continual Flame',
  level: 2,
  description: "A flame, equivalent in brightness to a torch, springs forth from an object that you touch. The effect looks like a regular flame, but it creates no heat and doesn't use oxygen. A continual flame can be covered or hidden but not smothered or quenched.",
  school: 'evocation',
  range: 'Touch',
  components: ['V','S','M (ruby dust worth 50 gp, which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 74,
)

Spell.create(
  name: 'Control Water',
  level: 4,
  description: "Until the spell ends, you control any freestanding water inside an area you choose that is a cube up to 100 feet on a side. You can choose from any of the following effects when you cast this spell. As an action on your turn, you can repeat the same effect or choose a different one. Flood, Part Water, Redirect Flow, Whirpool.",
  school: 'transmutation',
  range: '300 feet',
  components: ['V','S','M (a drop of water and a pinch of dust)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 75,
)

Spell.create(
  name: 'Control Weather',
  level: 8,
  description: "You take control of the weather within 5 miles of you for the duration. You must be outdoors to cast this spell. Moving to a place where you don't have a clear path to the sky ends the spell early.

When you cast the spell, you change the current weather conditions, which are determined by the DM based on the climate and season. You can change precipitation, temperature, and wind. It takes 1d4 x 10 minutes for the new conditions to take effect. Once they do so, you can change the conditions again. When the spell ends, the weather gradually returns to normal.",
  school: 'transmutation',
  cast_time: '10 minutes',
  range: 'Self (5-mile radius)',
  components: ['V','S','M (burning incense and bits of earth and wood mixed in water)'],
  duration: 'Concentration, up to 8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 76,
)

Spell.create(
  name: 'Cordon of Arrows',
  level: 2,
  description: "You plant four pieces of nonmagical ammunition – arrows or crossbow bolts – in the ground within range and lay magic upon them to protect an area. Until the spell ends, whenever a creature other than you comes within 30 feet of the ammunition for the first time on a turn or ends its turn there, one piece of ammunition flies up to strike it. The creature must succeed on a Dexterity saving throw or take 1d6 piercing damage. The piece of ammunition is then destroyed. The spell ends when no ammunition remains.

When you cast this spell, you can designate any creatures you choose, and the spell ignores them.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the amount of ammunition that can be affected increases by two for each slot level above 2nd.",
  school: 'transmutation',
  range: '5 feet',
  components: ['V','S','M (four or more arrows or bolts)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 77,
)

Spell.create(
  name: 'Counterspell',
  level: 3,
  description: "You attempt to interrupt a creature in the process of casting a spell. If the creature is casting a spell of 3rd level or lower, its spell fails and has no effect. If it is casting a spell of 4th level or higher, make an ability check using your spellcasting ability. The DC equals 10 + the spell's level. On a success, the creature's spell fails and has no effect.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the interrupted spell has no effect if its level is less than or equal to the level of the spell slot you used.",
  school: 'abjuration',
  cast_time: '1 reaction',
  range: '60 feet',
  components: ['S'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 78,
)

Spell.create(
  name: 'Create Food and Water',
  level: 3,
  description: "You create 45 pounds of food and 30 gallons of water on the ground or in containers within range, enough to sustain up to fifteen humanoids or five steeds for 24 hours. The food is bland but nourishing, and spoils if uneaten after 24 hours. The water is clean and doesn't go bad.",
  school: 'conjuration',
  range: '30 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 79,
)

Spell.create(
  name: 'Create or Destroy Water',
  level: 1,
  description: "You either create or destroy water.

Create Water: You create up to 10 gallons of clean water within range in an open container. Alternatively, the water falls as rain in a 30-foot cube within range, extinguishing exposed flames in the area.

Destroy Water: You destroy up to 10 gallons of water in an open container within range. Alternatively, you destroy fog in a 30-foot cube within range.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you create or destroy 10 additional gallons of water, or the size of the cube increases by 5 feet, for each slot level above 1st.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S','M (a drop of water if creating water or a few grains of sand if destroying it)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 80
)

Spell.create(
  name: 'Create Undead',
  level: 6,
  description: "You can cast this spell only at night. Choose up to three corpses of Medium or Small humanoids within range. Each corpse becomes a ghoul under your control. (The DM has game statistics for these creatures.)

As a bonus action on each of your turns, you can mentally command any creature you animated with this spell if the creature is within 120 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

The creature is under your control for 24 hours, after which it stops obeying any command you have given it. To maintain control of the creature for another 24 hours, you must cast this spell on the creature before the current 24-hour period ends. This use of the spell reasserts your control over up to three creatures you have animated with this spell, rather than animating new ones.

At Higher Levels: When you cast this spell using a 7th-level spell slot, you can animate or reassert control over four ghouls. When you cast this spell using an 8th-level spell slot, you can animate or reassert control over five ghouls or two ghasts or wights. When you cast this spell using a 9th-level spell slot, you can animate or reassert control over six ghouls, three ghasts or wights, or two mummies.",
  school: 'necromancy',
  range: '10 feet',
  components: ['V','S','M (one clay pot filled with grave dirt, one clay pot filled with brackish water, and one 150 gp black onyx stone for each corpse)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 81,
)

Spell.create(
  name: 'Creation',
  level: 5,
  description: "You pull wisps of shadow material from the Shadowfell to create a nonliving object of vegetable matter within range - soft goods, rope, wood, or something similar. You can also use this spell to create mineral objects such as stone, crystal, or metal. The object created must be no larger than a 5-foot cube, and the object must be of a form and material that you have seen before.

The duration depends on the object's material. If the object is composed of multiple materials, use the shortest duration.

Material - Duration:
Vegetable matter - 1 day
Stone/crystal - 12 hours
Precious metals - 1 hour
Gems - 10 minutes
Adamantine/Mithral - 1 minute

Using any material created by this spell as another spell's material component causes that spell to fail.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the cube increases by 5 feet for each slot level above 5th.",
  school: 'illusion',
  cast_time: '1 minute',
  range: '30 feet',
  components: ['V','S','M (a tiny piece of matter of the same type of the item you plan to create)'],
  duration: 'Special',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 82,
)

Spell.create(
  name: 'Crown of Madness',
  level: 2,
  description: "One humanoid of your choice that you can see within range must succeed on a Wisdom saving throw or become charmed by you for the duration. While the target is charmed in this way, a twisted crown of jagged iron appears on its head, and a madness glows in its eyes.

The charmed target must use its action before moving on each of its turns to make a melee attack against a creature other than itself that you mentally choose. The target can act normally on its turn if you choose no creature or if none are within its reach.

On your subsequent turns, you must use your action to maintain control over the target, or the spell ends. Also, the target can make a Wisdom saving throw at the end of each of its turns. On a success, the spell ends.",
  school: 'enchantment',
  range: '120 feet',
  duration: 'Concentration, 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 83,
)

Spell.create(
  name: "Crusader's Mantle",
  level: 3,
  description: "Holy power radiates from you in an aura with a 30-foot radius, awakening boldness in friendly creatures. Until the spell ends, the aura moves with you, centered on you. While in the aura, each non-hostile creature in the aura (including you) deals an extra 1d4 radiant damage when it hits with a weapon attack.",
  school: 'evocation',\
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 84,
)

Spell.create(
  name: 'Cure Wounds',
  level: 1,
  description: "A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d8 for each slot level above 1st.",
  school: 'evocation',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 85
)

Spell.create(
  name: 'Dancing Lights',
  level: 0,
  description: "You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius.

As a bonus action on your turn, you can move the lights up to 60 feet to a new spot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell's range.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S','M (a bit of phosphorus or wychwood, or a glowworm)'],
  duration: 'COncentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 86,
)
=begin
Spell.create(
  name: '',
  level: ,
  description: "",
  school: '',
  cast_time: '',
  range: '',
  components: '',
  duration: '',
  attack: '',
  atk_dmg: {
    1=> '',
  },
  dmg_type: '',
  id:
)
=end

Armor.create(
  stealth_disadvantage: 1,
  weight: 8,
  cost_gp: 5,
  name: 'Padded Armor',
)

Armor.create(
  weight: 10,
  cost_gp: 10,
  name: 'Leather'
)

Armor.create(
  ac_base: 12,
  weight: 13,
  cost_gp: 45,
  name: 'Studded Leather',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 12,
  weight: 12,
  cost_gp: 10,
  name: 'Hide Armor'
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 13,
  weight: 20,
  cost_gp: 50,
  name: 'Chain Shirt'
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 14,
  stealth_disadvantage: 1,
  weight: 45,
  cost_gp: 50,
  name: 'Scale Mail'
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 14,
  weight: 20,
  cost_gp: 400,
  name: 'Breastplate'
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 15,
  stealth_disadvantage: 1,
  weight: 40,
  cost_gp: 750,
  name: 'Half Plate'
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 14,
  stealth_disadvantage: 1,
  weight: 40,
  cost_gp: 30,
  name: 'Ring Mail'
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 16,
  stealth_disadvantage: 1,
  weight: 55,
  cost_gp: 75,
  str_req: 13,
  name: 'Chain Mail'
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 17,
  stealth_disadvantage: 1,
  weight: 60,
  cost_gp: 200,
  str_req: 15,
  name: 'Splint Armor'
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 18,
  stealth_disadvantage: 1,
  weight: 65,
  cost_gp: 1500,
  str_req: 15,
  name: 'Full Plate Steel'
)

Armor.create(
  arm_type: 'Shield',
  ac_base: 2,
  weight: 6,
  cost_gp: 10,
  name: 'Round Shield'
)

Armor.create(
  arm_type: 'Shield',
  ac_base: 2,
  weight: 6,
  cost_gp: 10,
  name: 'Wooden Shield'
)

Weapon.create(
  properties: ['Light'],
  weight: 2,
  cost_gp: 1,
  name: 'Club'
)

Weapon.create(
  dmg_type: 'piercing',
  properties: ['Finesse','Light','Thrown: 20/60'],
  weight: 1,
  cost_gp: 2,
  name: 'Dagger',
)

Weapon.create(
  hit_die: '1d8',
  properties: ['Two-handed'],
  weight: 10,
  cost_gp: 20,
  name: 'Greatclub',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'slashing',
  properties: ['Light','Thrown: 20/60'],
  weight: 2,
  cost_gp: 500,
  name: 'Handaxe',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 30/120'],
  weight: 2,
  cost_gp: 50,
  name: 'Javelin',
)

Weapon.create(
  properties: ['Light','Thrown: 20/60'],
  weight: 2,
  cost_gp: 200,
  name: 'Light Hammer',
)

Weapon.create(
  hit_die: '1d6',
  weight: 4,
  cost_gp: 500,
  name: 'Mace',
)

Weapon.create(
  hit_die: '1d6',
  properties: ['Versatile: 1d8'],
  weight: 4,
  cost_gp: 20,
  name: 'Quarterstaff',
)

Weapon.create(
  dmg_type: 'slashing',
  properties: ['Light'],
  weight: 2,
  cost_gp: 100,
  name: 'Sickle',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 20/60','Versatile: 1d8'],
  weight: 3,
  cost_gp: 100,
  name: 'Spear',
)

Weapon.create(
  ranged: 1,
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Ammunition: 80/320','Loading','Two-handed'],
  weight: 5,
  cost_gp: 2500,
  name: 'Light Crossbow',
)

Weapon.create(
  ranged: 1,
  dmg_type: 'piercing',
  properties: ['Finesse','Thrown: 20/60'],
  weight: 1,
  cost_gp: 5,
  name: 'Dart',
)

Weapon.create(
  ranged: 1,
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Ammunition: 80/320','Two-handed'],
  weight: 2,
  cost_gp: 2500,
  name: 'Shortbow',
)

Weapon.create(
  ranged: 1,
  properties: ['Ammunition: 30/120'],
  weight: 0,
  cost_gp: 10,
  name: 'Sling',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'slashing',
  properties: ['Versatile: 1d10'],
  weight: 4,
  cost_gp: 1000,
  name: 'Battleaxe',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  weight: 2,
  cost_gp: 1000,
  name: 'Flail',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'slashing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 6,
  cost_gp: 2000,
  name: 'Glaive',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d12',
  dmg_type: 'slashing',
  properties: ['Heavy','Two-handed'],
  weight: 7,
  cost_gp: 3000,
  name: 'Greataxe',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '2d6',
  dmg_type: 'slashing',
  properties: ['Heavy','Two-handed'],
  weight: 6,
  cost_gp: 5000,
  name: 'Greatsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'slashing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 6,
  cost_gp: 2000,
  name: 'Halberd',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d12',
  dmg_type: 'piercing',
  properties: ['Reach','Special'],
  weight: 6,
  cost_gp: 1000,
  name: 'Lance',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'slashing',
  properties: ['Versatile: 1d10'],
  weight: 3,
  cost_gp: 1500,
  name: 'Longsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '2d6',
  properties: ['Heavy','Two-handed'],
  weight: 10,
  cost_gp: 1000,
  name: 'Maul',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  weight: 4,
  cost_gp: 1500,
  name: 'Morningstar',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'piercing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 18,
  cost_gp: 500,
  name: 'Pike',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Finesse'],
  weight: 2,
  cost_gp: 2500,
  name: 'Rapier',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'slashing',
  properties: ['Finesse','Light'],
  weight: 3,
  cost_gp: 2500,
  name: 'Scimitar',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Finesse','Light'],
  weight: 2,
  cost_gp: 1000,
  name: 'Shortsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 20/60','Versatile: 1d8'],
  weight: 4,
  cost_gp: 500,
  name: 'Trident',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  weight: 2,
  cost_gp: 500,
  name: 'War pick',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  properties: ['Versatile: 1d10'],
  weight: 2,
  cost_gp: 1500,
  name: 'Warhammer',
)

Weapon.create(
  wep_type: 'martial',
  dmg_type: 'slashing',
  properties: ['Finesse','Reach'],
  weight: 3,
  cost_gp: 200,
  name: 'Whip',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1',
  dmg_type: 'piercing',
  properties: ['Ammunition: 25/100','Loading'],
  weight: 1,
  cost_gp: 1000,
  name: 'Blowgun',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Ammunition: 30/120','Light','Loading'],
  weight: 3,
  cost_gp: 7500,
  name: 'Hand Crossbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d10',
  dmg_type: 'piercing',
  properties: ['Ammunition: 100/400','Heavy','Loading','Two-handed'],
  weight: 18,
  cost_gp: 5000,
  name: 'Heavy Crossbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Ammunition: 150/600','Heavy','Two-handed'],
  weight: 2,
  cost_gp: 5000,
  name: 'Longbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '',
  dmg_type: '',
  properties: ['Special','Thrown: 5/15'],
  weight: 3,
  cost_gp: 100,
  name: 'Net',
)

Equipment.create(
  name: 'Abacus',
  weight: 2,
  cost_gp: 200,
)

Equipment.create(
  name: 'Acid (vial)',
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Alchemist's Fire (flask)",
  weight: 1,
  cost_gp: 5000,
)

Equipment.create(
  name: "Arrows",
  count: 20,
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Blowgun Needles",
  count: 50,
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Bolts",
  count: 20,
  weight: 2,
  cost_gp: 100,
)

Equipment.create(
  name: "Sling Bullets",
  count: 20,
  weight: 2,
  cost_gp: 4,
)

Equipment.create(
  name: "Antitoxin (vial)",
  cost_gp: 5000,
)

Equipment.create(
  name: "Arcane Crystal",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Arcane Orb",
  weight: 3,
  cost_gp: 2000,
)

Equipment.create(
  name: "Arcane Rod",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Arcane Wand",
  weight: 1,
  cost_gp: 1000,
)

Backpack = Equipment.create(
  name: "Backpack",
  weight: 5,
  cost_gp: 200,
)

BallBearings = Equipment.create(
  name: "Ball bearings",
  count: 1000,
  weight: 2,
  cost_gp: 100,
)

Equipment.create(
  name: "Barrel",
  weight: 70,
  cost_gp: 200,
)

Equipment.create(
  name: "Basket",
  weight: 2,
  cost_gp: 40,
)

Equipment.create(
  name: "Bedroll",
  weight: 7,
  cost_gp: 100,
)

Bell = Equipment.create(
  name: "Bell",
  cost_gp: 100,
)

Equipment.create(
  name: "Blanket",
  weight: 3,
  cost_gp: 50,
)

Equipment.create(
  name: "Block and Tackle",
  weight: 5,
  cost_gp: 100,
)

Equipment.create(
  name: "Book",
  weight: 5,
  cost_gp: 2500,
)

Equipment.create(
  name: "Bottle",
  weight: 2,
  cost_gp: 200,
)

Equipment.create(
  name: "Bucket",
  weight: 2,
  cost_gp: 5,
)

Equipment.create(
  name: "Caltrops",
  count: 20,
  weight: 2,
  cost_gp: 100,
)

Candle = Equipment.create(
  name: "Candle",
  cost_gp: 1,
)

Equipment.create(
  name: "Case, crossbow bolts",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Case, map or scroll",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Chain, 10ft",
  weight: 10,
  cost_gp: 500,
)

Equipment.create(
  name: "Chalk, 1 piece",
  cost_gp: 1,
)

Equipment.create(
  name: "Chest",
  weight: 25,
  cost_gp: 500,
)

Equipment.create(
  name: "Climber's Kit",
  weight: 12,
  cost_gp: 2500,
)

Equipment.create(
  name: "Clothes, common",
  weight: 3,
  cost_gp: 50,
)

Equipment.create(
  name: "Clothes, costume",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Clothes, fine",
  weight: 6,
  cost_gp: 1500,
)

Equipment.create(
  name: "Clothes, sacred vestments",
  weight: 8,
  cost_gp: 2000,
)

Equipment.create(
  name: "Clothes, traveler's",
  weight: 4,
  cost_gp: 200,
)

Equipment.create(
  name: "Component Pouch",
  weight: 2,
  cost_gp: 250,
)

Crowbar = Equipment.create(
  name: "Crowbar",
  weight: 5,
  cost_gp: 200,
)

Equipment.create(
  name: "Sprig of Mistletoe",
  cost_gp: 100,
)

Equipment.create(
  name: "Totem",
  cost_gp: 100,
)

Equipment.create(
  name: "Wooden Staff",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Yew Wand",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Fishing Tackle",
  weight: 4,
  cost_gp: 100,
)
Equipment.create(
  name: "Flask",
  weight: 1,
  cost_gp: 2,
)

Equipment.create(
  name: "Grappling Hook",
  weight: 4,
  cost_gp: 200,
)

Hammer = Equipment.create(
  name: "Hammer",
  weight: 3,
  cost_gp: 100,
)

Equipment.create(
  name: "Hammer, sledge",
  weight: 10,
  cost_gp: 200,
)

Equipment.create(
  name: "Healer's Kit",
  weight: 3,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Amulet",
  weight: 1,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Emblem",
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Reliquary",
  weight: 2,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Water (flask)",
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Prayer Book",
  weight: 1,
  cost_gp: 50
)

Equipment.create(
  name: "Hourglass",
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Hunting Trap",
  weight: 25,
  cost_gp: 500,
)

Equipment.create(
  name: "Incense",
  cost_gp: 20,
)

Equipment.create(
  name: "Ink, 1 ounce bottle",
  cost_gp: 1000,
)

Equipment.create(
  name: "Ink Pen",
  cost_gp: 2,
)

Equipment.create(
  name: "Jug or pitcher",
  weight: 4,
  cost_gp: 2,
)

Equipment.create(
  name: "Ladder (10 foot)",
  weight: 25,
  cost_gp: 10,
)

Lamp = Equipment.create(
  name: "Lamp",
  weight: 1,
  cost_gp: 50,
)

BullseyeLantern = Equipment.create(
  name: "Bullseye Lantern",
  weight: 2,
  cost_gp: 1000,
)

HoodedLantern = Equipment.create(
  name: "Hooded Lantern",
  weight: 2,
  cost_gp: 500,
)

Equipment.create(
  name: "Lock",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Magnifying Glass",
  cost_gp: 10000,
)

Equipment.create(
  name: "Manacles",
  weight: 6,
  cost_gp: 200,
)

Equipment.create(
  name: "Mess Kit",
  weight: 1,
  cost_gp: 20,
)

Equipment.create(
  name: "Mirror, steel",
  weight: 1,
  cost_gp: 500,
)

OilFlask = Equipment.create(
  name: "Oil (flask)",
  weight: 1,
  cost_gp: 10,
)

Equipment.create(
  name: "Paper (one sheet)",
  cost_gp: 20,
)

Equipment.create(
  name: "Parchment (one sheet)",
  cost_gp: 10,
)

Equipment.create(
  name: "Perfume (vial)",
  cost_gp: 500,
)

Equipment.create(
  name: "Miner's Pick",
  weight: 10,
  cost_gp: 200,
)

Piton = Equipment.create(
  name: "Piton",
  cost_gp: 5,
)

Equipment.create(
  name: "Poison, basic (vial)",
  cost_gp: 10000,
)

Equipment.create(
  name: "Pole, 10 foot",
  weight: 7,
  cost_gp: 5,
)

Equipment.create(
  name: "Pot, iron",
  weight: 10,
  cost_gp: 200,
)

Equipment.create(
  name: "Potion of Healing",
  weight: 1,
  cost_gp: 5000,
)

Equipment.create(
  name: "Pouch",
  weight: 1,
  cost_gp: 50,
)

Equipment.create(
  name: "Quiver",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Ram, portable",
  weight: 35,
  cost_gp: 400,
)

Rations = Equipment.create(
  name: "Rations (1 day)",
  weight: 2,
  cost_gp: 50,
)

Equipment.create(
  name: "Robes",
  weight: 4,
  cost_gp: 100,
)

HempRope = Equipment.create(
  name: "Rope, hempen (50 feet)",
  weight: 10,
  cost_gp: 100,
)

SilkRope = Equipment.create(
  name: "Rope, silk (50 feet)",
  weight: 5,
  cost_gp: 1000,
)

Equipment.create(
  name: "Sack",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Scale, merchant's",
  weight: 3,
  cost_gp: 500,
)

Equipment.create(
  name: "Sealing Wax",
  cost_gp: 50,
)

Equipment.create(
  name: "Shovel",
  weight: 5,
  cost_gp: 200,
)

Equipment.create(
  name: "Signal Whistle",
  cost_gp: 5,
)

Equipment.create(
  name: "Signet Ring",
  cost_gp: 500,
)

Equipment.create(
  name: "Soap",
  cost_gp: 2,
)

Equipment.create(
  name: "Spellbook",
  weight: 3,
  cost_gp: 5000,
)

Equipment.create(
  name: "Spikes, iron",
  count: 10,
  weight: 5,
  cost_gp: 100,
)

Equipment.create(
  name: "Spyglass",
  weight: 1,
  cost_gp: 100000,
)

String10ft = Equipment.create(
  name: "String, 10 feet",
  cost_gp: 20,
)

Equipment.create(
  name: "Tent, two-person",
  weight: 20,
  cost_gp: 200,
)

Tinderbox = Equipment.create(
  name: "Tinderbox",
  weight: 1,
  cost_gp: 50,
)

Equipment.create(
  name: "Torch",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Vial",
  cost_gp: 100,
)

Waterskin = Equipment.create(
  name: "Waterskin",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Whetstone",
  weight: 1,
  cost_gp: 1,
)

Tool.create(
  name: "Alchemist's Supplies",
  cost_cp: 5000,
  weight: 8,
)
Tool.create(
  name: "Brewer's Supplies",
  cost_cp: 2000,
  weight: 9,
)
Tool.create(
  name: "Calligrapher's Supplies",
  cost_cp: 1000,
  weight: 5,
)
Tool.create(
  name: "Carpenter's Tools",
  cost_cp: 800,
  weight: 6,
)
Tool.create(
  name: "Cartographer's Tools",
  cost_cp: 1500,
  weight: 6,
)
Tool.create(
  name: "Cobbler's Tools",
  cost_cp: 500,
  weight: 5,
)
Tool.create(
  name: "Cook's Utensils",
  cost_cp: 100,
  weight: 8,
)
Tool.create(
  name: "Glassblower's Tools",
  cost_cp: 3000,
  weight: 5,
)
Tool.create(
  name: "Jeweler's Tools",
  cost_cp: 2500,
  weight: 2,
)
Tool.create(
  name: "Leatherworker's Tools",
  cost_cp: 500,
  weight: 5,
)
Tool.create(
  name: "Mason's Tools",
  cost_cp: 1000,
  weight: 8,
)
Tool.create(
  name: "Painter's Supplies",
  cost_cp: 1000,
  weight: 5,
)
Tool.create(
  name: "Potter's Tools",
  cost_cp: 1000,
  weight: 3,
)
Tool.create(
  name: "Smith's Tools",
  cost_cp: 2000,
  weight: 8,
)
Tool.create(
  name: "Tinker's Tools",
  cost_cp: 5000,
  weight: 10,
)
Tool.create(
  name: "Weaver's Tools",
  cost_cp: 100,
  weight: 5,
)
Tool.create(
  name: "Woodcarver's Tools",
  cost_cp: 100,
  weight: 5,
)

Tool.create(
  name: "Disguise Kit",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 3,
)
Tool.create(
  name: "Forgery Kit",
  tool_type: 'generic',
  cost_cp: 1500,
  weight: 5,
)
Tool.create(
  name: "Herbalism Kit",
  tool_type: 'generic',
  cost_cp: 500,
  weight: 3,
)
Tool.create(
  name: "Navigator's Tools",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 2,
)
Tool.create(
  name: "Poisoner's Kit",
  tool_type: 'generic',
  cost_cp: 5000,
  weight: 2,
)
Tool.create(
  name: "Thieves' Tools",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 1,
)
Tool.create(
  name: "Dice Set",
  tool_type: 'gaming',
  cost_cp: 10,
)
Tool.create(
  name: "Dragonchess Set",
  tool_type: 'gaming',
  cost_cp: 100,
  weight: 1,
)
Tool.create(
  name: "Playing Cards",
  tool_type: 'gaming',
  cost_cp: 50,
)
Tool.create(
  name: "Three-Dragon Ante Set",
  tool_type: 'gaming',
  cost_cp: 100,
)

Tool.create(
  name: "Bagpipes",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 6,
)
Tool.create(
  name: "Drum",
  tool_type: 'instrument',
  cost_cp: 600,
  weight: 3,
)
Tool.create(
  name: "Dulcimer",
  tool_type: 'instrument',
  cost_cp: 2500,
  weight: 10,
)
Tool.create(
  name: "Flute",
  tool_type: 'instrument',
  cost_cp: 200,
  weight: 1,
)
Tool.create(
  name: "Lute",
  tool_type: 'instrument',
  cost_cp: 3500,
  weight: 2,
)
Tool.create(
  name: "Lyre",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 2,
)
Tool.create(
  name: "Horn",
  tool_type: 'instrument',
  cost_cp: 300,
  weight: 2,
)
Tool.create(
  name: "Pan Flute",
  tool_type: 'instrument',
  cost_cp: 1200,
  weight: 2,
)
Tool.create(
  name: "Shawm",
  tool_type: 'instrument',
  cost_cp: 200,
  weight: 1,
)
Tool.create(
  name: "Viol",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 1,
)
Gearpack.create(
  name: "Burglar's Pack",
  cost_cp: 1600,
  id: 1,
)
Gearpack.create(
  name: "Diplomat's Pack",
  cost_cp: 3900,
  id: 2,
)
Gearpack.create(
  name: "Dungeoneer's Pack",
  cost_cp: 1200,
  id: 3,
)
Gearpack.create(
  name: "Entertainer's Pack",
  cost_cp: 4000,
  id: 4,
)
Gearpack.create(
  name: "Explorer's Pack",
  cost_cp: 1000,
  id: 5,
)
Gearpack.create(
  name: "Priest's Pack",
  cost_cp: 1900,
  id: 6,
)
Gearpack.create(
  name: "Scholar's Pack",
  cost_cp: 4000,
  id: 7,
)
#Burglar's Pack
EquipmentGearpack.create(
  equipment_id: Backpack.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: BallBearings.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: String10ft.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Bell.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Candle.id,
  gearpack_id: 1,
  count: 5,
)
EquipmentGearpack.create(
  equipment_id: Crowbar.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Hammer.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Piton.id,
  gearpack_id: 1,
  count: 10,
)
EquipmentGearpack.create(
  equipment_id: HoodedLantern.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: OilFlask.id,
  gearpack_id: 1,
  count: 2,
)
EquipmentGearpack.create(
  equipment_id: Rations.id,
  gearpack_id: 1,
  count: 5,
)
EquipmentGearpack.create(
  equipment_id: Tinderbox.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Waterskin.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: HempRope.id,
  gearpack_id: 1,
)