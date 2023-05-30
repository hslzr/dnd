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
    this.subclass = null;
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
    this.rituals = [];
    this.cantrips = [];

    this.age = null;
    this.height = null;
    this.weight = null;
    this.eyes = null;
    this.skin = null;
    this.hair = null;

    this.armor_equipped = [];
    this.armor_class = 'unarmored';
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
    'Smith`s Tools',
    'Brewer`s Supplies',
    'Mason`s Tools',
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
  backpack: ['Explorer`s Pack'],

  features: [
    [
      'Rage: Advantage on STR checks and STR saves, Rage Damage bonus, resistance to bludgeoning, piercing and slashing damage.',
      'Unarmored Defense: Without armor your AC is 10 + Dex modifier',
    ],
    [
      'Reckless Attack: Advantage on your first melee STR attack roll and attacks against you until your next turn.',
      'Danger Sense: Advantage on DEX saves against effects you can see. You can`t do this if you are blinded, deafened, or incapacitated.',
    ],
    [
      'Primal Path: Choose a path that shapes the nature of your rage.',
    ],
    ['ASI'],
    [
      'Extra Attack: You may attack twice whenever you take the Attack actin on your turn',
      'Fast Movement: Your speed increases by 10 feet while you aren`t wearing heavy armor',
    ],
    [],
    [
      'Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren`t incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.',
    ],
    ['ASI'],
    [
      'Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
    ],
    [],
    [
      'Relentless Rage: If you drop to 0 hit points while raging and don`t die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.',
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

  //two empty at the beginning for levels 1 and 2, I don`t want to complicate parsing this data
  //I want to treat it the same as the features array
  subclasses: [
    {
      name: 'Berserker',
      features: [
        [],
        [],
        [
          'Frenzy: You can go into a frenzy when you rage. If you do so, for the duration of your rage, you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.',
        ],
        [],
        [],
        [
          'Mindless Rage: You can`t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.',
        ],
        [],
        [],
        [],
        [
          'Intimidating Presence: You can use your action to frighten someone with your menacing presence. Choose one creature you can see within 30 feet, if it can see or hear you it must succeed on a WIS save with DC of 8 plus your proficiency bonus plus your CHA modifier, or be frightened of you until the end of your next turn. On subsequent turns you can use your action to extend this effect another turn. The effect ends if the creature ends its turn out of line of sight or more than 60 feet away. If they successfully save, you can`t use this on them again for 24 hours.',
        ],
        [],
        [],
        [],
        [
          'Retaliation: When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.',
        ],
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
        [
          'Spirit Seeker: You gain the ability to cast Beast Sense and Speak With Animals as rituals.',
          'Totem Spirit: Choose a totem spirit and acquire its feature. You must make or acquire a physical totem object that imcorporates fur or feathers, claws, teeth, or bones of the totem aniumal. At your option, you also gain minior physical attributes that are reminiscent of your totem spirit. For example, if you have a bear totem spirit, you might be unusually hairy and thick-skinned, or if your totem is the eagle, your eyes turn bright yellow. Your totem animal might be an animal related to those listed here but more appropriate to your homeland.',
        ],
        [],
        [],
        [
          'Aspect of the Beast: You gain a magical benefit based on the totem animal of your choice.',
        ],
        [],
        [],
        [],
        [
          'Spirit Walker: You can cast the Commune With Nature spell as a ritual. When you do, a spiritual version of one of your totem animals appears to you to convey the information you seek.',
        ],
        [],
        [],
        [],
        [
          'Totemic Attunement: You gain a magical benefit based on the totem animal of your choice.',
        ],
        [],
        [],
        [],
        [],
        [],
        [],
      ],
      totem_spirit: null,
      totem_choices: [
        'Bear: While raging, you have resistance to all damage except psychic damage. The spirit of the bear makes you tough enough to stand up to any punishment.',
        'Eagle: While you`re ragina and aren`t wearing heavy armor, other creatures have disadvantage on opportunity attack rolls against you, and you can use the Dash action as a bonus action on your turn. The spirit of the eagle makes you into a predator who can weave through the gray with ease.',
        'Wolf: While you`re raging, your friends have advantage on melee attack rolls against any creature within 5 feet of you that is hostile to you. The spirit of the wolf makes you a leader of hunters.',
      ],
      beast_aspect: null,
      aspect_choices: [
        'Bear: You gain the might of a bear. your carrying capacity is doubled, and you have advantage on STR checks made to push, pull, lift, or break objects.',
        'Eagle: You gain the eyesight of an eagle. you can see up to 1 mile away with no difficulty, able to discern even fine details as though looking at something no more than 100 feet away from you. Additionally, dim light doesn`t impose disadvantage on your Wisdom(Perception) checks.',
        'Wolf: You gain the hunting sensibilities of a wolf. You can track other creatures while traveling at a fast pace, and you can move stealthily while traveling at a normal pace.',
      ],
      totemic_attunement: null,
      attunement_choices: [
        'Bear: While you`re raging, any creature within 5 feet of you that`s hostile to you has disadvantage on attack rolls against targets other than you or another character with this feature. An enemy is immune to this effect if it can`t see or hear you or if it can`t be frightened.',
        'Eagle: While raging, you have a flying speed equal to your current walking speed. This benefit works only in short bursts; you fall if you end your turn in the air and nothing else is holding you aloft.',
        'Wolf: While you`re raging, you can use a bonus action on your turn to knock a Large or smaller creature prone when you hit it with meleee weapon attack.',
      ],

      Initial(character, totem_animal) {
        character.rituals.push('Beast Sense');
        character.rituals.push('Speak With Animals');
        character.subclass.totem_spirit = totem_animal;
      },

      //on level 6 and 14, args must include " aspect_choice/attunement_choice: /*Bear/Eagle/Wolf*/ "
      LevelUp(character, args) {
        if (character.level == 6) {
          character.subclass.beast_aspect = args.aspect_choice;
        }
        if (character.level == 10) {
          character.rituals.push('Commune With Nature');
        }
        if (character.level == 14) {
          character.subclass.totemic_attunement =
            args.attunement_choice;
        }
      },
    },
  ],

  AfterStats(character) {
    character.starting_hp += AbilityModifier(character.con);

    //Fast Movement
    if (character.level > 2 && character.armor_class != 'heavy') {
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
    if (character.armor_equipped == [])
      character.armor_class = 'unarmored';

    //Unarmored Defense - base
    if (character.armor_class == 'unarmored') {
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

  Subclasses have an Initial() lifecycle function I want called when they are chosen
  as well as a LevelUp() function that should be called to update subclass features
*/

class Background {
  constructor(background) {
    this.name = background.name;
    this.description = background.description;

    this.tools = background.tools;
    this.armor = background.armor;
    this.weapons = background.weapons;
    this.skills = background.skills;

    this.languages = background.languages;
    this.equipment = background.equipment;
    this.feature = background.feature;
    this.traits = background.traits;
    this.ideals = background.ideals;
    this.bonds = background.bonds;
    this.flaws = background.flaws;

    this.specialty = background.specialty;
    this.functions = background.functions;
  }
}

const Acolyte = {
  name: 'Acolyte',
  description:
    'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  tools: [''],
  armor: [''],
  weapons: [''],
  skills: ['insight', 'religion'],
  languages: 2,
  equipment: [
    'A holy symbol',
    'A prayer book',
    '5 sticks of incense',
    'vestments',
    'common clothes',
    '15gp',
  ],
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
  specialty: [''],
  functions: [''],
  feature:
    'Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.',
};
