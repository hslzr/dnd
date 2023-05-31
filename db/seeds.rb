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

Barbarian.subclasses.create(
  name: "Berserker",
  features: [
        'none',
        'none',
        'Frenzy: You can go into a frenzy when you rage. If you do so, for the duration of your rage, you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.',
        'none',
        'none',
        'Mindless Rage: You can`t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.',
        'none',
        'none',
        'none',
        'Intimidating Presence: You can use your action to frighten someone with your menacing presence. Choose one creature you can see within 30 feet, if it can see or hear you it must succeed on a WIS save with DC of 8 plus your proficiency bonus plus your CHA modifier, or be frightened of you until the end of your next turn. On subsequent turns you can use your action to extend this effect another turn. The effect ends if the creature ends its turn out of line of sight or more than 60 feet away. If they successfully save, you can`t use this on them again for 24 hours.',
        'none',
        'none',
        'none',
        'Retaliation: When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.',
        'none',
        'none',
        'none',
        'none',
        'none',
        'none',
  ]
)

Barbarian.subclasses.create(
  name: "Totem Warrior",
  features: [
        'none',
        'none',
        'Spirit Seeker: You gain the ability to cast Beast Sense and Speak With Animals as rituals. | Totem Spirit: Choose a totem spirit and acquire its feature. You must make or acquire a physical totem object that imcorporates fur or feathers, claws, teeth, or bones of the totem aniumal. At your option, you also gain minior physical attributes that are reminiscent of your totem spirit. For example, if you have a bear totem spirit, you might be unusually hairy and thick-skinned, or if your totem is the eagle, your eyes turn bright yellow. Your totem animal might be an animal related to those listed here but more appropriate to your homeland.',
        'none',
        'none',
        'Aspect of the Beast: You gain a magical benefit based on the totem animal of your choice.',
        'none',
        'none',
        'none',
        'Spirit Walker: You can cast the Commune With Nature spell as a ritual. When you do, a spiritual version of one of your totem animals appears to you to convey the information you seek.',
        'none',
        'none',
        'none',
        'Totemic Attunement: You gain a magical benefit based on the totem animal of your choice.',
        'none',
        'none',
        'none',
        'none',
        'none',
        'none',
  ],
  custom: "
    totem_spirit: 0,
    totem_choices: [
      'Bear: While raging, you have resistance to all damage except psychic damage. The spirit of the bear makes you tough enough to stand up to any punishment.',
      'Eagle: While you`re ragina and aren`t wearing heavy armor, other creatures have disadvantage on opportunity attack rolls against you, and you can use the Dash action as a bonus action on your turn. The spirit of the eagle makes you into a predator who can weave through the gray with ease.',
      'Wolf: While you`re raging, your friends have advantage on melee attack rolls against any creature within 5 feet of you that is hostile to you. The spirit of the wolf makes you a leader of hunters.',
    ],
    beast_aspect: 0,
    aspect_choices: [
      'Bear: You gain the might of a bear. your carrying capacity is doubled, and you have advantage on STR checks made to push, pull, lift, or break objects.',
      'Eagle: You gain the eyesight of an eagle. you can see up to 1 mile away with no difficulty, able to discern even fine details as though looking at something no more than 100 feet away from you. Additionally, dim light doesn`t impose disadvantage on your Wisdom(Perception) checks.',
      'Wolf: You gain the hunting sensibilities of a wolf. You can track other creatures while traveling at a fast pace, and you can move stealthily while traveling at a normal pace.',
    ],
    totemic_attunement: 0,
    attunement_choices: [
      'Bear: While you`re raging, any creature within 5 feet of you that`s hostile to you has disadvantage on attack rolls against targets other than you or another character with this feature. An enemy is immune to this effect if it can`t see or hear you or if it can`t be frightened.',
      'Eagle: While raging, you have a flying speed equal to your current walking speed. This benefit works only in short bursts; you fall if you end your turn in the air and nothing else is holding you aloft.',
      'Wolf: While you`re raging, you can use a bonus action on your turn to knock a Large or smaller creature prone when you hit it with meleee weapon attack.',
    ]
  "
)

Acolyte = Background.create(
  name: "Acolyte",
  description: 'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  skill_prof: ['insight', 'religion'],
  languages: [2],
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
  feature:
    'Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.',
)

Feat_alert = Feat.create(
  name: 'Alert',
  description: 'Always on the lookout for danger, you won`t be fooled by just anyone.',
  features: [
    'You gain +5 to initiative.',
    'You can`t be surprised while you are conscious.',
    'Other creatures don`t gain advantage on attack rolls against you as a result of being unseen by you.'
  ],
  method: ''
)