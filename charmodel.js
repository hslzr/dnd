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
    this.strmax = 20;
    this.dex = null;
    this.dexmax = 20;
    this.con = null;
    this.conmax = 20;
    this.int = null;
    this.intmax = 20;
    this.wis = null;
    this.wismax = 20;
    this.cha = null;
    this.chamax = 20;
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

    this.armor_equipped = [];
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
      'Primal Path: Choose a path that shapes the nature of your rage.',
    ],
    ['ASI'],
    [
      'Extra Attack: You may attack twice whenever you take the Attack actin on your turn',
      "Fast Movement: Your speed increases by 10 feet while you aren't wearing heavy armor",
    ],
    [],
    [
      "Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren't incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.",
    ],
    ['ASI'],
    [
      'Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    ],
    [],
    [
      "Relentless Rage: If you drop to 0 hit points while raging and don't die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.",
    ],
    ['ASI'],
    [
      'Brutal Critical: You can roll two additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    ],
    [],
    [
      'Persistent Rage: Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.',
    ],
    ['ASI'],
    [
      'Brutal Critical: You can roll three additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    ],
    [
      'Indomitable Might: If your total for a Strength check is less than your Strength score, you may use that score instead',
    ],
    [],
    [
      'Primal Champion: Your STR and CON scores increase by 4, your maximum for those scores is now 24.',
    ],
  ],

  //two empty at the beginning for levels 1 and 2, I don't want to complicate parsing this data
  //I want to treat it the same as the features array
  subclasses: [
    {
      name: 'Berserker',
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
      ],
    },
    {
      name: 'Totem Warrior',
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
      ],
    },
  ],

  AfterStats(character) {
    character.starting_hp += AbilityModifier(character.con);

    //Fast Movement
    if (
      character.level > 2 &&
      !character.armor_equipped.includes('heavy') &&
      !character.armor_equipped.includes('plate')
    ) {
      character.speed += 10;
    }

    //Primal Champion
    if (character.level > 19) {
      character.strmax = 24;
      character.conmax - 24;
      character.str += 4;
      character.con += 4;
    }
  },

  Roundup(character) {
    //Unarmored Defense - base
    if (character.armor_equipped == []) {
      character.ac = 10 + AbilityModifier(character.dex);
    }
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
    LevelUp

*/
