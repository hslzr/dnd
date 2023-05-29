function AbilityModifier(score) {
  return Math.floor(score / 2) - 5;
}

class PlayerCharacter {
  constructor() {
    this.player_name = null;
    this.character_name = null;
    this.race = null;
    this.racial_traits = [];
    this.class = null;
    this.class_features = [];
    this.background = null;

    this.trait = null;
    this.bond = null;
    this.ideal = null;
    this.flaw = null;
    this.alignment = null;

    this.str = null;
    this.dex = null;
    this.con = null;
    this.int = null;
    this.wis = null;
    this.cha = null;
    this.primary_abilities = [];
    this.saving_throws = [];
    this.proficiency_bonus = null;
    this.passive_perception = null;

    this.skills = [];
    this.armor_prof = [];
    this.weapon_prof = [];
    this.tool_prof = [];
    this.expertises = [];
    this.languages = [];

    this.level = null;
    this.ac = null;
    this.initiative = null;
    this.speed = null;
    this.inspiration = null;

    this.starting_hp = null;
    this.max_hp = null;
    this.hp = null;
    this.temp_hp = null;
    this.hit_die_size = null;
    this.num_of_hit_die = null;

    this.spell_ability = null;
    this.spell_save_dc = null;
    this.spell_atk_bonus = null;
    this.spell_slots = [];
    this.spell_list = null;
    this.spells_known = [];
    this.spells_prepared = [];
    this.cantrips = [];

    this.age = null;
    this.height = null;
    this.weight = null;
    this.eyes = null;
    this.skin = null;
    this.hair = null;

    this.armor_equipped = null;
    this.weapon_equipped = [];
    this.shield = null;
    this.backpack = null;
    this.quiver = null;
    this.tools = [];
    this.magicitems = [];
    this.currency = [];
    this.equipment = [];
    this.custom_equipment = null;
    this.image_link = null;
  }

}

class Race {
  constructor(race) {
    this.name = race.name;
    this.ability_score_increase = race.ability_score_increase;
    this.age_limit = race.age_limit;
    this.alignment_default = race.alignment_default;
    this.height = race.height;
    this.languages = race.languages;
    this.language_choices = race.language_choices;
    this.weapons = race.weapons;
    this.tool_choice = race.tool_choice;
    this.size = race.size;
    this.speed = race.speed;
    this.racial_traits = race.racial_traits;
    this.subraces = race.subraces;
  }
}

const Dwarven_Race = {
  name: 'Dwarf',
  ability_score_increase: ['con', 2],
  age_limit: 450,
  alignment_default: ['lawful', 'good'],
  height: [4, 5],
  languages: ['Common', 'Dwarvish'],
  language_choices: [0],
  weapons: ['Battleaxe', 'Handaxe', 'Light Hammer', 'Warhammer'],
  armor: [],
  tool_choice: [
    1,
    "Smith's Tools",
    "Brewer's Supplies",
    "Mason's Tools",
  ],
  size: 'medium',
  speed: 25,
  racial_traits: [
    'Speed not reduced by heavy armor',
    'Darkvision',
    'Dwarven Resilience: Advantage on Poison saves and resistance to Poison damage.',
    'Stonecunning: Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.',
  ],
  subraces: [
    {
      name: 'Hill Dwarf',
      ability_score_increase: ['wis', 1],
      racial_traits: [
        'Dwarven Toughness: Your level is added to your hit point maximum.',
      ],
      AfterClass(base_char, sheet_char) {
        if (base_char.max_hp != null && base_char.level != null) {
          sheet_char.max_hp += sheet_char.level;
        }
      },
    },
    {
      name: 'Mountain Dwarf',
      ability_score_increase: ['str', 2],
      racial_traits: ['Dwarven Armor Training: Light and Medium'],
      armor: ['Light', 'Medium'],
    },
  ],
};

const Barbarian = {
  name: 'Barbarian',
  hit_die_size: 12,
  num_of_hit_die: 1,
  starting_hp: 12,
  primary_abilities: ['str'],
  saving_throws: ['str', 'con'],
  armor: ['light', 'medium', 'shields'],
  weapons: ['simple', 'martial'],
  skill_choice: [
    2,
    [
      'Animal Handling',
      'Athletics',
      'Intimidation',
      'Nature',
      'Perception',
      'Survival',
    ],
  ],
  weapon_choices: [
    [1, ['Greataxe', 'any_martial']],
    [1, ['2 Handaxes', 'any_simple']],
  ],
  equipment: ['4 Javelins'],
  backpack: ["Explorer's Pack"],

  features: [
    [
      'Rage: Advantage on STR checks and STR saves, Rage Damage bonus, resistance to bludgeoning, piercing and slashing damage.',
      'Unarmored Defense: Without armor your AC is 10 + Dex modifier',
    ],
    [
      'Reckless Attack: Advantage on your first melee STR attack roll and attacks against you until your next turn.',
      "Danger Sense: Advantage on DEX saves against effects you can see. You can't do this if you are blinded, deafened, or incapacitated.",
    ],
    [
      "Primal Path: Choose a path that shapes the nature of your rage."
    ],
    [
      "ASI"
    ],
    [],
    [],
    [],
    [
      "ASI"
    ],
    [],
    [],
    [],
    [
      "ASI"
    ],
    [],
    [],
    [],
    [
      "ASI"
    ],
    [],
    [],
    [],
    [],
  ],
  functions: [
    [
      Roundup(character) {
        if(character.armor_equipped == '') {
          character.ac = 10 + AbilityModifier(character.dex);
        }
      }
    ],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ]

  subclasses: [
    {
      name: "Berserker",
      features: [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
      ]
    }
    {
      name: "Totem Warrior",
      features: [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
      ]
    }
  ]

  AfterStats(character) {
    //hp at level 1 == 12 + Con modifier
    character.starting_hp += AbilityModifier(character.con);
  },

  LevelUp(character) {
    character.max_hp += 7 + AbilityModifier(character.con);
  },
};

/*

  Lifecycle Events of Character Creation
    AfterRace
    AfterClass
    AfterStats
    AfterBackground
    AfterFeats
    Roundup

*/
