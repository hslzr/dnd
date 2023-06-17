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
  features: [
    'Speed not reduced by heavy armor',
    'Darkvision',
    'Dwarven Resilience: Advantage on Poison saves and resistance to Poison damage.',
    'Stonecunning: Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.',
  ]
)

DwarvenRace.subraces.create(
  name: 'Hill Dwarves',
  asi: [0,0,0,0,1,0],
  features: [
        'Dwarven Toughness: Your level is added to your hit point maximum.',
      ],
  extra_languages: 0,
)

DwarvenRace.subraces.create(
  name: 'Mountain Dwarves',
  asi: [2,0,0,0,0,0],
  features: ['Dwarven Armor Training'],
  armor: ['Light','Medium'],
  extra_languages: 0,
)

#slivers are just for testing stuff
SliverRace = Race.create(
  name: 'Sliver',
  asi: [0,1,0,1,0,0],
  age_limit: 15,
  heightlow: "4'",
  heighthigh: "6'",
  languages: ['Common', 'Infernal'],
  weapons: ['Spear'],
  speed: 35,
  features: [
    'Spells affecting members of your party affect you as well.',
    'Darkvision',
    'Sliverskin: Resistance to Psychic damage.',
    'Hive Wisdom: You have advantage on Wisdom(Perception) checks underground.',
  ]
)

SliverRace.subraces.create(
  name: 'Gemhide Slivers',
  asi: [0,0,0,1,1,0],
  features: ['Mana Armor: Resistance to magic damage the first time it is taken each day.'],
  skills: ['Arcana'],
  extra_languages: 0,
)

SliverRace.subraces.create(
  name: 'Hive Slivers',
  asi: [0,0,1,0,0,0],
  features: ['Clone: You may create a simulacrum of yourself once per long rest that lasts for 4 hours.'],
  extra_languages: 0,
  tools: ['Jeweler\'s Tols'],
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
  equipment_choices: [
    'Greataxe | any_martial',
    '2 Handaxes | any_simple',
  ],
  equipment: ['4 Javelins', 'Explorer`s Pack'],
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
    4=>['ASI'],
    5=>['Extra Attack: You may attack twice whenever you take the Attack actin on your turn.',
       'Fast Movement: Your speed increases by 10 feet while you aren`t wearing heavy armor'
      ],
    7=>['Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren`t incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.'],
    8=>['ASI'],
    9=>['Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    11=>['Relentless Rage: If you drop to 0 hit points while raging and don`t die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.'],
    12=>['ASI'],
    13=>['Brutal Critical: You can roll two additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    15=>['Persistent Rage: Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.'],
    16=>['ASI'],
    17=>['Brutal Critical: You can roll three additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    18=>['Indomitable Might: If your total for a Strength check is less than your Strength score, you may use that score instead'],
    20=>['Primal Champion: Your STR and CON scores increase by 4, your maximum for those scores is now 24.'],
  },
  custom: {}
)

Barbarian.subclasses.create(
  name: "Berserker",
  features: {
    3=> ['Frenzy: You can go into a frenzy when you rage. If you do so, for the duration of your rage, you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.'],
    6=> ['Mindless Rage: You can`t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.'],
    10=> ['Intimidating Presence: You can use your action to frighten someone with your menacing presence. Choose one creature you can see within 30 feet, if it can see or hear you it must succeed on a WIS save with DC of 8 plus your proficiency bonus plus your CHA modifier, or be frightened of you until the end of your next turn. On subsequent turns you can use your action to extend this effect another turn. The effect ends if the creature ends its turn out of line of sight or more than 60 feet away. If they successfully save, you can`t use this on them again for 24 hours.'],
    14=> ['Retaliation: When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.']
  },
  custom: {}
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
    10=> ['Spirit Walker: You can cast the Commune With Nature spell as a ritual. When you do, a spiritual version of one of your totem animals appears to you to convey the information you seek.'],
    14=> [
      'Bear: While you`re raging, any creature within 5 feet of you that`s hostile to you has disadvantage on attack rolls against targets other than you or another character with this feature. An enemy is immune to this effect if it can`t see or hear you or if it can`t be frightened.',
      'Eagle: While raging, you have a flying speed equal to your current walking speed. This benefit works only in short bursts; you fall if you end your turn in the air and nothing else is holding you aloft.',
      'Wolf: While you`re raging, you can use a bonus action on your turn to knock a Large or smaller creature prone when you hit it with meleee weapon attack.',
    ],
  },
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
  skill_choices: ['Animal Handling','Athletics','Insight,','Investigation','Nature','Perception','Stealth','Survival'],
  num_skills: 3,
  equipment_choices: [
    "Scale Mail | Leather Armor",
    "Two Shortswords | Two Simple Melee Weapons",
    "Dungeoneer's Pack | Explorer's Pack"
  ],
  equipment: ['Longbow','Quiver of Arrows'],
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
      "ASI"
    ],
    5=>[
      "Extra Attack: You can attack twice whenever you take the Attack action on your turn."
    ],
    8=>[
      "Land's Stride: Moving through nonmagical difficult terrain coss you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement."
    ],
    10=>[
      "Hide in Plain Sight: You can spend 1 minute creating camouflage for yourself. You must have access to fresh mud, dirt, plants, soot, and other naturally occurring materials with which to create your camouflage.
      Once you are camouflaged in this way, you can try to hide by pressing yourself up against a solid surface, such as a tree or wall, that is at least as tall and wide as you are. You gain a +10 bonus to Dexterity(Stealth) checks as long as you remain there without moving or taking actions. Once you move or take an action or a reaction, you must camouflage yourself again to gain this benefit."
    ],
    14=>[
      "Vanish: You can use the Hide action as a bonus action on your turn. Also, you can't be tracked by nonmagical means, unless you choose to leave a trail."
    ],
    18=>[
      "Feral Sense: You gain preternatural senses that help you fight creatures you can't see. When you attack a creature you can't see, your inability to see it doesn't impose disadvantage on your attack rolls against it.
      You are also aware of the location of any invisible creature within 30 feet of you, provided that the creature isn't hidden from you and you aren't blinded or deafened."
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
  }
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
  features: {}
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
  custom: {}
)

Acolyte = Background.create(
  name: "Acolyte",
  description: 'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  skills: ['Insight', 'Religion'],
  extra_languages: 2,
  equipment: [
    'A holy symbol',
    'A prayer book',
    '5 sticks of incense',
    'vestments',
    'common clothes'
  ],
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
  features:
    ['Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.']
)

Feat_alert = Feat.create(
  name: 'Alert',
  description: 'Always on the lookout for danger, you won`t be fooled by just anyone.',
  features: [
      'You gain +5 to initiative.',
      'You can`t be surprised while you are conscious.',
      'Other creatures don`t gain advantage on attack rolls against you as a result of being unseen by you.'
    ]
)



Spell.create(
  name: 'Ice Missile',
  level: 1,
  description: 'You lob a magical spear of ice.',
  cast_time: 'Instantaneous',
  range: '30 feet',
  components: 'Verbal, Somatic',
  duration: '',
  attack: 'true',
  atk_dmg: {
    1=> '2d4',
    6=> '3d4',
    12=> '4d4',
    16=> '5d4',
  },
  dmg_type: 'Cold',
  id: 1
)

Spell.create(
  name: 'Junk Missile',
  level: 1,
  description: 'You fling a magical wad of junk at blinding speed.',
  cast_time: 'Instantaneous',
  range: '30 feet',
  components: 'Verbal',
  duration: '',
  attack: 'true',
  atk_dmg: {
    1=> '1d6',
    6=> '2d6',
    12=> '3d6',
    16=> '4d6',
  },
  dmg_type: 'Trash',
  id: 2
)

Spell.create(
  name: 'Shockwave',
  level: 2,
  description: 'A blast of sonic energy radiates from you, deafening and shocking all around you.',
  cast_time: 'Instantaneous',
  range: '15 feet',
  components: 'Verbal',
  duration: '',
  attack: 'true',
  atk_dmg: {
    1=> '2d8',
    6=> '3d8',
    12=> '4d8',
    16=> '5d8',
  },
  dmg_type: 'Wind',
  id: 3
)

Spell.create(
  name: 'Lightning Bolt',
  level: 3,
  description: 'A bolt of lightning smites your enemy',
  cast_time: 'Instantaneous',
  range: '45 feet',
  components: 'Somatic, Material',
  duration: '2 rounds',
  attack: 'true',
  atk_dmg: {
    1=> '2d10 + 4',
    6=> '3d10 + 8',
    12=> '4d10 + 12',
    16=> '5d10 + 16',
  },
  dmg_type: 'Electric',
  id: 4
)

Junk_wizard = ClassSpellList.create(
  name: 'Ranger'
)

ClassSpellListsSpells.create(
  class_spell_list_id: Junk_wizard.id,
  spell_id: 1
)
ClassSpellListsSpells.create(
  class_spell_list_id: Junk_wizard.id,
  spell_id: 2
)
ClassSpellListsSpells.create(
  class_spell_list_id: Junk_wizard.id,
  spell_id: 3
)
ClassSpellListsSpells.create(
  class_spell_list_id: Junk_wizard.id,
  spell_id: 4
)
