import { Controller } from '@hotwired/stimulus';

//all options come from the db, new db additions should just work
export default class extends Controller {
  static targets = [
    //in order of appearance
    'langButton',
    'classSkillsButton',
    'toolsButton',
    'subclassButton',
    'charLevel',
    'charName',
    'profBonus',
    'passPerception',
    'strBase',
    'strMod',
    'strSavingThrowMod',
    'strSaveProf',
    'athleticsMod',
    'athleticsProf',
    'dexBase',
    'dexMod',
    'dexSavingThrowMod',
    'dexSaveProf',
    'acrobaticsMod',
    'acrobaticsProf',
    'sleightOfHandMod',
    'sleightOfHandProf',
    'stealthMod',
    'stealthProf',
    'conBase',
    'conMod',
    'conSavingThrowMod',
    'conSaveProf',
    'intBase',
    'intMod',
    'intSavingThrowMod',
    'intSaveProf',
    'arcanaMod',
    'arcanaProf',
    'historyMod',
    'historyProf',
    'investigationMod',
    'investigationProf',
    'natureMod',
    'natureProf',
    'religionMod',
    'religionProf',
    'wisBase',
    'wisMod',
    'wisSavingThrowMod',
    'wisSaveProf',
    'animalHandlingMod',
    'animalHandlingProf',
    'insightMod',
    'insightProf',
    'medicineMod',
    'medicineProf',
    'perceptionMod',
    'perceptionProf',
    'survivalMod',
    'survivalProf',
    'chaBase',
    'chaMod',
    'chaSavingThrowMod',
    'chaSaveProf',
    'deceptionMod',
    'deceptionProf',
    'intimidationMod',
    'intimidationProf',
    'performanceMod',
    'performanceProf',
    'persuasionMod',
    'persuasionProf',
    'aboutClass',
    'aboutSubclass',
    'aboutLevel',
    'aboutBackground',
    'aboutRace',
    'aboutSubrace',
    'aboutAlignment',
    'aboutExperiencePoints',
    'substatAC',
    'substatInitiative',
    'substatSpeed',
    'substatInspiration',
    'trackingMaxHP',
    'trackingCurrentHP',
    'trackingTemporaryHP',
    'trackingHitDice',
    'trackingDeathSaveSuccess',
    'trackingDeathSaveFailure',
    'featureList',
    'raceFeatures',
    'subraceFeatures',
    'classFeatures',
    'subclassFeatures',
    'subclassFeaturesChoices',
    'backgroundFeatures',
    'raceSkills',
    'subraceSkills',
    'classSkills',
    'subclassSkills',
    'backgroundSkills',
    'featSkills',
    'raceLanguages',
    'extraLanguages',
    'subraceLanguages',
    'classLanguages',
    'subclassLanguages',
    'backgroundLanguages',
    'raceWeapons',
    'subraceWeapons',
    'classWeapons',
    'subclassWeapons',
    'backgroundWeapons',
    'raceArmor',
    'subraceArmor',
    'classArmor',
    'subclassArmor',
    'backgroundArmor',
    'raceTools',
    'subraceTools',
    'classTools',
    'subclassTools',
    'backgroundTools',
    'racialASIBonus',
    'subraceASIBonus',
    'castingClass',
    'castingAbility',
    'castingSaveDC',
    'castingAttackBonus',
    'castingSpellLimit',
    'castingCantripLimit',
    'spellsButton',
    'equipGP',
    'equipSP',
    'equipCP',
    'equipArmor',
    'dialogLanguages',
    'languageModalList',
    'langLimit',
    'dialogClassSkills',
    'classSkillsModalList',
    'classSkillsLimit',
    'dialogTools',
    'toolsModalList',
    'toolsLimit',
    'dialogSubclassFeatures',
    'subclassFeaturesModalList',
    'subclassFeaturesLimit',
    'dialogASI',
    'asiModalList',
    'asiLimit',
    'asiButton',
    'dialogSpells',
    'spellsModalList',
    'spellsLimit',
    'cantripLimit',
    'spellSlots1',
    'spellSlots2',
    'spellSlots3',
    'spellSlots4',
    'spellSlots5',
    'spellSlots6',
    'spellSlots7',
    'spellSlots8',
    'spellSlots9',
    'spellsTaken0',
    'spellsTaken1',
    'spellsTaken2',
    'spellsTaken3',
    'spellsTaken4',
    'spellsTaken5',
    'spellsTaken6',
    'spellsTaken7',
    'spellsTaken8',
    'spellsTaken9',
    'tbifTraits',
    'tbifBonds',
    'tbifIdeals',
    'tbifFlaws',
    'tbifModalList',
    'dialogTBIF',
    'tbifButton',
    'equipmentModalList',
    'dialogEquipment',
    'equipmentClassStart',
    'equipmentBGStart',
    'equipmentButton',
    'startingEquipment',
  ];

  connect() {
    //we'll take over from the turbo frame and store the form data in a Map
    this.choices = new Map();
    this.choices.set('race', 'none');
    this.choices.set('subrace', 'none');
    this.choices.set('player_class', 'none');
    this.choices.set('subclass', 'none');
    this.choices.set('background', 'none');
    this.choices.set('level', 0);

    //variables set later but available as noted
    ///set on randomStats

    //0 is our flag value because it isnt possible in dnd
    this.stats = [0, 0, 0, 0, 0, 0];
    //store initial stats here, modify and collate in this.stats
    this.base_stats = [0, 0, 0, 0, 0, 0];

    ///set on level update in catHandler
    this.prof_mod;
    ///set on class form select
    this.spellcasting_ability;

    //used for selection and updating
    this.skills = new Map(); //initialized later in setSkillMap(), a collection of targets
    //i feel like I could save a lot of effort if I used these better
    this.languages = this.blankCategoryMap();
    this.extra_languages = this.blankCategoryMap();
    this.tools = this.blankCategoryMap();
    this.weapons = this.blankCategoryMap();
    this.armor = this.blankCategoryMap();
    this.features = this.blankCategoryMap();
    this.classSkillChoices; //set in catUpdate
    this.numClassSkillChoices; //set in catUpdate
    this.raceToolChoices; //set in catUpdate
    this.raceASI = 0; //set in catUpdate, used to modify stats
    this.subraceASI = 0;
    this.raceASICount; //set in finalPass -> classFeatureHandler, modifies stats at milestone levels
    this.subraceASICount;
    this.nosubchoice = false;

    this.classFeatureList; //set in catUpdate called in finalPass -> classFeatureHandler
    this.subclassFeatureList; //set in catUpdate called in finalPass -> classFeatureHandler
    this.level; // set in catUpdate

    //button colors
    this.disabled_color = 'bg-orange-300';
    this.active_color = 'bg-blue-400';

    //locking modals until their content is able to be populated
    this.langButtonTarget.disabled = true;
    this.classSkillsButtonTarget.disabled = true;

    //spells
    this.spellList = false; //we'll try setting this to a correct collection of spells with a new fetch in catUpdate
  }

  //----------------------------- Main Sheet Update Flow ---------------------------------//
  categoryHandler(event) {
    let labels = event.params;
    let list = event.target.children;
    this.updateChoices();

    if (event.target.id != 'level') {
      for (let i = 0; i < list.length; i++) {
        //list is an HTMLCollection
        if (list.item(i).selected) {
          let name = list.item(i).innerText;
          fetch(`${labels.url}${name}`)
            .then((response) => response.json())
            .then((data) => this.catUpdate(data, event.target.id));
        }
      }
    } else {
      this.catUpdate({}, event.target.id);
    }
  }

  catUpdate(data, cat_type) {
    //event.target.id is actually the :name param
    let languages, extra_lang, skills, weps, arm, tools, features;

    //Handle category specific behaviors here
    //we set these first variables so we can add and remove the correct items whenever a form select changes
    //the setters are just for things like Size or Spellcasting Stat that are unique to certain categories
    switch (cat_type) {
      case 'race':
        languages = this.raceLanguagesTarget;
        skills = this.raceSkillsTarget;
        weps = this.raceWeaponsTarget;
        arm = this.raceArmorTarget;
        tools = this.raceToolsTarget;
        features = this.raceFeaturesTarget;

        //setters
        this.aboutRaceTarget.innerText = data.name;
        this.sheet_race = data.name; //these are used by levelUpdate()
        this.substatSpeedTarget.innerText = data.speed;
        this.raceToolChoices = data.tool_choice;
        this.raceASI = data.asi;

        this.removeAllChildNodes(this.racialASIBonusTarget);
        this.racialASIBonusTarget.append(this.getPTag(data.name));
        this.putRacialASI(this.raceASI, this.racialASIBonusTarget);
        break;

      case 'subrace':
        languages = this.subraceLanguagesTarget;
        skills = this.subraceSkillsTarget;
        weps = this.subraceWeaponsTarget;
        arm = this.subraceArmorTarget;
        tools = this.subraceToolsTarget;
        features = this.subraceFeaturesTarget;

        //setters
        this.aboutSubraceTarget.innerText = data.name;
        this.sheet_subrace = data.name;
        this.subraceASI = data.asi;

        this.removeAllChildNodes(this.subraceASIBonusTarget);
        this.subraceASIBonusTarget.append(this.getPTag(data.name));
        this.putRacialASI(
          this.subraceASI,
          this.subraceASIBonusTarget
        );
        break;

      case 'player_class':
        languages = this.classLanguagesTarget;
        skills = this.classSkillsTarget;
        weps = this.classWeaponsTarget;
        arm = this.classArmorTarget;
        tools = this.classToolsTarget;
        features = this.classFeaturesTarget;

        this.aboutClassTarget.innerText = data.name;
        this.sheet_class = data.name;
        this.hit_die = data.hit_die;
        this.saving_throws = data.saving_throws;
        this.classFeatureList = data.features;
        this.spell_table = data.spell_table;
        this.class_equip_choices = data.equipment_choices;
        //the seed stores saving throw proficiencies as indexes to this array
        let primary_proficiencies = [
          this.strSaveProfTarget,
          this.dexSaveProfTarget,
          this.conSaveProfTarget,
          this.intSaveProfTarget,
          this.wisSaveProfTarget,
          this.chaSaveProfTarget,
        ];
        primary_proficiencies.forEach((target) => {
          target.classList.remove('bg-black');
        });

        //this.saving_throws has indexes of primary_proficiences whose text we set to '+'
        for (let i = 0; i < this.saving_throws.length; i++) {
          let item = this.saving_throws[i];
          primary_proficiencies[item].classList.add('bg-black');
        }

        //class skill options for modal
        this.classSkillChoices = data.skill_choices;
        this.numClassSkillChoices = data.num_skills;

        //spell statboxes
        this.spellcasting_ability = data.spellcasting_ability;
        let statnames = [
          'None',
          'Strangth',
          'Dexterity',
          'Constitution',
          'Intelligence',
          'Wisdom',
          'Charisma',
        ];
        this.castingAbilityTarget.innerText =
          statnames[this.spellcasting_ability];

        if (data.spellcasting_ability != 0) {
          //spell list fetching

          fetch(`/class_spell_lists/${data.name}`)
            .then((response) => response.json())
            .then((data) => (this.spellList = data));
        }
        break;

      case 'subclass':
        languages = this.subclassLanguagesTarget;
        skills = this.subclassSkillsTarget;
        weps = this.subclassWeaponsTarget;
        arm = this.subclassArmorTarget;
        tools = this.subclassToolsTarget;
        features = this.subclassFeaturesTarget;

        //setters
        this.aboutSubclassTarget.innerText = data.name;
        this.sheet_subclass = data.name;
        this.subclassFeatureList = data.features; //default features
        this.subclassFeatureChoices = data.custom; //modal choices
        break;

      case 'background':
        languages = null; //handled by a modal, null fizzles putClassFeatures
        skills = this.backgroundSkillsTarget;
        weps = this.backgroundWeaponsTarget;
        arm = this.backgroundArmorTarget;
        tools = this.backgroundToolsTarget;
        features = this.backgroundFeaturesTarget;

        //setters
        this.aboutBackgroundTarget.innerText = data.name;
        this.sheet_background = data.name;
        this.equipGPTarget.innerText = data.gold;
        this.bg_equip_choices = data.equipment_choices;

        //tbif
        this.traits = data.traits;
        this.bonds = data.bonds;
        this.ideals = data.ideals;
        this.flaws = data.flaws;
        break;

      case 'level':
        this.level = event.target.value;

        this.aboutLevelTarget.innerText = this.level;
        this.prof_mod = Math.ceil(this.level / 4) + 1;

        this.profBonusTarget.innerText = this.prof_mod;

      default:
        break;
    }
    if (cat_type != 'level') {
      this.populateCatAbilities(
        data,
        cat_type,
        languages,
        skills,
        weps,
        arm,
        tools,
        features
      );
    }
    if (this.raceASI != 0 && this.subraceASI != 0) {
      this.calculateStats();
      this.updateStats();
      this.statModUpdate();
    }

    //once the changed category has been updated on the sheet, we want to finish up if possible
    //this runs if choices is entirely filled out
    if (this.isChoicesFull() && this.stats[0] != 0) {
      this.finalPass();
    }
  }

  populateCatAbilities(
    data,
    cat_type,
    languages,
    skills,
    weps,
    arm,
    tools,
    features
  ) {
    //not all categories have these so I'm defaulting to empty array
    //which will make putClassFeatures fizzle out and do nothing
    let data_lang = data.languages || [];
    this.languages.set(cat_type, data_lang);
    let data_extra_lang = data.extra_languages || [];
    this.extra_languages.set(cat_type, data_extra_lang);

    let data_skills = data.skills || [];

    let data_weps = data.weapons || [];
    this.weapons.set(cat_type, data_weps);
    let data_arm = data.armor || [];
    this.armor.set(cat_type, data_arm);

    let data_tools = data.tools || [];
    if (cat_type != 'race') {
      //races only have the racial choice for now
      this.tools.set(cat_type, data_tools);
    }

    let data_features = data.features || [];
    this.features.set(cat_type, data_features);

    //we output the needed <p></p> tags to the given target
    this.putClassFeatures(data.name, data_lang, languages);
    this.putClassFeatures(data.name, data_weps, weps);
    this.putClassFeatures(data.name, data_arm, arm);
    this.putClassFeatures(data.name, data_tools, tools);

    if (cat_type != 'player_class') {
      //these are choices for a class
      this.putClassFeatures(data.name, data_skills, skills);
      if (cat_type != 'subclass')
        this.putClassFeatures(data.name, data_features, features);
    }
  }

  finalPass(code = 0) {
    this.setSkillMap();
    this.populateSkillModifiers();

    if (code == 0) {
      this.classFeatureHandler(); //we depend on level to show correct class features so we have to do this in finalPass
      this.subclassFeatureHandler();
    }
    //recalculate stats
    this.calculateStats();
    this.updateStats();
    this.statModUpdate(1);

    this.passPerceptionTarget.innerText =
      this.calcMod(this.stats[4]) + 10;

    this.substatInitiativeTarget.innerText =
      this.dexModTarget.innerText;

    if (!this.equipArmorTarget.hasChildNodes()) {
      this.substatACTarget.innerText =
        10 + this.calcMod(this.stats[1]);
    }

    this.trackingHitDiceTarget.innerText = `${this.level}d${this.hit_die}`;

    if (code == 0) {
      this.activateButtons();

      if (this.nosubchoice) {
        this.deactivateButton(this.subclassButtonTarget);
      }

      //running these on a non-spellcasting class breaks stuff
      if (this.spellcasting_ability == 0) {
        this.deactivateButton(this.spellsButtonTarget);
      } else {
        this.setSpellInformation();
      }

      this.makeModalChoices();
    }

    this.resetProficiencies();

    //at end of base calculations we should apply custom methods brought in by categories
    //e.g. the Barbarian Unarmored Defense
    this.customModifiers(); //tbw
  }

  putRacialASI(list, target) {
    let stats = [
      'Strength',
      'Dexterity',
      'Constitution',
      'Intelligence',
      'Wisdom',
      'Charisma',
    ];
    for (let i = 0; i < 6; i++) {
      if (list[i] > 0) {
        target.append(
          this.getTag('p', '', `+${list[i]} ${stats[i]}`)
        );
      }
    }
  }

  //----------------------------- Final Pass methods ---------------------------------//
  setSkillMap() {
    this.skills.set('Athletics', [
      this.stats[0],
      this.athleticsModTarget,
      this.athleticsProfTarget,
      '',
    ]);
    this.skills.set('Acrobatics', [
      this.stats[1],
      this.acrobaticsModTarget,
      this.acrobaticsProfTarget,
      '',
    ]);
    this.skills.set('Sleight of Hand', [
      this.stats[1],
      this.sleightOfHandModTarget,
      this.sleightOfHandProfTarget,
      '',
    ]);
    this.skills.set('Stealth', [
      this.stats[1],
      this.stealthModTarget,
      this.stealthProfTarget,
      '',
    ]);
    this.skills.set('Arcana', [
      this.stats[3],
      this.arcanaModTarget,
      this.arcanaProfTarget,
      '',
    ]);
    this.skills.set('History', [
      this.stats[3],
      this.historyModTarget,
      this.historyProfTarget,
      '',
    ]);
    this.skills.set('Investigation', [
      this.stats[3],
      this.investigationModTarget,
      this.investigationProfTarget,
      '',
    ]);
    this.skills.set('Nature', [
      this.stats[3],
      this.natureModTarget,
      this.natureProfTarget,
      '',
    ]);
    this.skills.set('Religion', [
      this.stats[3],
      this.religionModTarget,
      this.religionProfTarget,
      '',
    ]);
    this.skills.set('Animal Handling', [
      this.stats[4],
      this.animalHandlingModTarget,
      this.animalHandlingProfTarget,
      '',
    ]);
    this.skills.set('Insight', [
      this.stats[4],
      this.insightModTarget,
      this.insightProfTarget,
      '',
    ]);
    this.skills.set('Medicine', [
      this.stats[4],
      this.medicineModTarget,
      this.medicineProfTarget,
      '',
    ]);
    this.skills.set('Perception', [
      this.stats[4],
      this.perceptionModTarget,
      this.perceptionProfTarget,
      '',
    ]);
    this.skills.set('Survival', [
      this.stats[4],
      this.survivalModTarget,
      this.survivalProfTarget,
      '',
    ]);
    this.skills.set('Deception', [
      this.stats[5],
      this.deceptionModTarget,
      this.deceptionProfTarget,
      '',
    ]);
    this.skills.set('Intimidation', [
      this.stats[5],
      this.intimidationModTarget,
      this.intimidationProfTarget,
      '',
    ]);
    this.skills.set('Performance', [
      this.stats[5],
      this.performanceModTarget,
      this.performanceProfTarget,
      '',
    ]);
    this.skills.set('Persuasion', [
      this.stats[5],
      this.persuasionModTarget,
      this.persuasionProfTarget,
      '',
    ]);
  } //utility but depends on stats being assigned

  populateSkillModifiers() {
    //the class saving throws are stored as indexes to the bonus array so we go through
    //all this to assign 6 values possible bonuses from this.saving_throws then output to 6 different targets
    let save_modifiers = [
      this.strSavingThrowModTarget,
      this.dexSavingThrowModTarget,
      this.conSavingThrowModTarget,
      this.intSavingThrowModTarget,
      this.wisSavingThrowModTarget,
      this.chaSavingThrowModTarget,
    ];

    let bonuses = [0, 0, 0, 0, 0, 0];
    this.saving_throws.forEach((item) => {
      bonuses[item] += this.prof_mod;
    });
    for (let i = 0; i < 6; i++) {
      save_modifiers[i].innerText =
        bonuses[i] + this.calcMod(this.stats[i]);
    }

    this.updateAllProficiencies();
  }

  classFeatureHandler() {
    let classFeatures = [];

    //flatten the portions of the feature array up to the level of the player and save in above arrays
    let marray = Object.entries(this.classFeatureList);

    marray.forEach((entry) => {
      if (parseInt(entry[0]) <= this.level) {
        entry[1].forEach((feature) => {
          classFeatures.push(feature);
        });
      }
    });

    this.putClassFeatures(
      this.choices.get('player_class'),
      classFeatures,
      this.classFeaturesTarget
    );
  }

  subclassFeatureHandler() {
    let subclassFeatures = [];
    this.nosubchoice = true;

    if (this.subclassFeatureChoices != {}) {
      this.chooseSubclassFeatures(
        Object.entries(this.subclassFeatureChoices)
      );
      this.nosubchoice = false;
    }

    Object.entries(this.subclassFeatureList).forEach((entry) => {
      if (parseInt(entry[0]) <= this.level) {
        entry[1].forEach((entry) => {
          subclassFeatures.push(entry);
        });
      }
    });

    this.putClassFeatures(
      this.choices.get('subclass'),
      subclassFeatures,
      this.subclassFeaturesTarget
    );
  }

  updateAllProficiencies() {
    //based on innerText of ProfTarget
    let skilliter = this.skills.values();
    for (let i = 0; i < this.skills.size; i++) {
      let value = skilliter.next().value;
      let bonus = this.calcMod(value[0]);
      if (Array.from(value[2].classList).includes('bg-black'))
        bonus += this.prof_mod;
      if (Array.from(value[2].classList).includes('bg-white'))
        bonus += this.prof_mod * 2;
      value[1].innerText = bonus;
    }
  }

  setSpellInformation() {
    let spell_mod = this.calcMod(
      this.stats[this.spellcasting_ability - 1]
    );
    this.castingSaveDCTarget.innerText =
      spell_mod + this.prof_mod + 8;

    this.castingAttackBonusTarget.innerText =
      spell_mod + this.prof_mod;

    this.castingSpellLimitTarget.innerText =
      this.spell_table[this.level - 1][0];

    this.castingCantripLimitTarget.innerText =
      this.spell_table[this.level - 1][1];

    let slot_targets = [
      this.spellSlots1Target,
      this.spellSlots2Target,
      this.spellSlots3Target,
      this.spellSlots4Target,
      this.spellSlots5Target,
      this.spellSlots6Target,
      this.spellSlots7Target,
      this.spellSlots8Target,
      this.spellSlots9Target,
    ];

    for (let i = 0; i < 9; i++) {
      slot_targets[i].innerText =
        this.spell_table[this.level - 1][i + 2];
      //using i+2 because the first two indexes are spells known and cantrips known
    }
  }

  makeModalChoices() {
    this.chooseLanguages();
    this.chooseClassSkills();
    this.chooseTools();
    //subclass modal activated on detection of a choice in Subclass.features
    if (this.spellList) this.chooseSpells();
    this.chooseTBIF();
    this.chooseEquipment();
    this.chooseASI();
  }

  resetProficiencies() {
    let sources = [
      this.raceSkillsTarget,
      this.subraceSkillsTarget,
      this.classSkillsTarget,
      this.subclassSkillsTarget,
      this.backgroundSkillsTarget,
      this.featSkillsTarget,
    ];

    let assigned_skills = [];

    sources.forEach((source) => {
      source.childNodes.forEach((node) => {
        let text = node.innerText;
        if (!assigned_skills.includes(text) && text.slice(-1) != ':')
          assigned_skills.push(node.innerText);
      });
    });

    //set proftarget innerText which will get picked up by updateAllProficiencies
    let iter = this.skills.entries();
    for (let i = 0; i < this.skills.size; i++) {
      let entry = iter.next().value;
      if (assigned_skills.includes(entry[0]))
        entry[1][2].classList.add('bg-black');
      else entry[1][2].classList.remove('bg-black');
    }

    this.updateAllProficiencies();
  }

  customModifiers() {}

  //----------------------------- Choice Modals ---------------------------------//
  //----------------- Languages Modal ------------------//
  chooseLanguages() {
    let allLanguages = [
      'Common',
      'Elvish',
      'Dwarvish',
      'Giant',
      'Gnomish',
      'Goblin',
      'Halfling',
      'Orc',
      'Abyssal',
      'Celestial',
      'Draconic',
      'Deep Speech',
      'Infernal',
      'Primordial',
      'Sylvan',
      'Tabaxi',
      'Undercommon',
    ];

    this.removeAllChildNodes(this.languageModalListTarget);

    var list = [];
    this.raceLanguagesTarget.childNodes.forEach((node) => {
      let text = node.innerText;
      if (text.slice(-1) != ':') list.push(text); //this eliminates labels like Dwarf:
    });
    this.subraceLanguagesTarget.childNodes.forEach((node) => {
      let text = node.innerText;
      if (text.slice(-1) != ':') list.push(text);
    });

    let options = allLanguages.filter(
      (lang) => list.indexOf(lang) === -1
    );

    let init = 0;
    let temp;
    let lang_iter = this.extra_languages.values();
    for (let i = 0; i < this.extra_languages.size; i++) {
      temp = lang_iter.next().value;
      if (typeof temp === 'string') init += parseInt(temp);
    }

    this.langLimitTarget.innerText = `Choose ${init}`;

    this.populateListModal(this.languageModalListTarget, options); //this will populate the <ul> with checkboxes
    //onsubmit we'll validate the number chosen, and put the chosen ones into their own div
    //when backgrounds change we can empty that div and start over
  }

  submitLanguageChoices(event) {
    this.removeAllChildNodes(this.extraLanguagesTarget);
    //we clear the output here, all we have to do is limit the number of boxes you can check

    let chosen = [];
    this.languageModalListTarget.childNodes.forEach((node) => {
      if (node.firstChild.checked) {
        chosen.push(node.firstChild.value);
      }
    });
    if (
      chosen.length ==
      parseInt(this.langLimitTarget.innerText.slice(-1))
    ) {
      this.putModalChecksToSheet(chosen, this.extraLanguagesTarget);
      event.target.parentNode.close();
    }
  }
  //----------------- Tools Modal ------------------//
  chooseTools() {
    this.removeAllChildNodes(this.toolsModalListTarget);

    if (this.raceToolChoices.length > 0) {
      this.toolsLimitTarget.innerText = `Choose 1`;
    } else {
      this.toolsLimitTarget.innerText = 'No Tools';
    }

    this.populateListModal(
      this.toolsModalListTarget,
      this.raceToolChoices
    );
  }

  submitToolsChoices() {
    this.removeAllChildNodes(this.raceToolsTarget);
    let racename = this.choices.get('race');
    let chosen = [];
    this.toolsModalListTarget.childNodes.forEach((node) => {
      if (node.firstChild.checked) {
        chosen.push(node.firstChild.value);
      }
    });
    if (chosen.length == 1) {
      this.putModalChecksToSheet(
        chosen,
        this.raceToolsTarget,
        racename
      );
      event.target.parentNode.close();
    }
  }
  //----------------- Class Modal ------------------//
  chooseClassSkills() {
    this.removeAllChildNodes(this.classSkillsModalListTarget);

    this.classSkillsLimitTarget.innerText = `Choose ${this.numClassSkillChoices}`;

    this.populateListModal(
      this.classSkillsModalListTarget,
      this.classSkillChoices
    );
  }

  submitClassSkillsChoices(event) {
    this.removeAllChildNodes(this.classSkillsTarget);

    let chosen = [];
    this.classSkillsModalListTarget.childNodes.forEach((node) => {
      if (node.firstChild.checked) {
        chosen.push(node.firstChild.value);
      }
    });
    if (
      chosen.length ==
      parseInt(this.classSkillsLimitTarget.innerText.slice(-1))
    ) {
      this.putModalChecksToSheet(
        chosen,
        this.classSkillsTarget,
        this.choices.get('player_class')
      );
      event.target.parentNode.close();
    }
    this.resetProficiencies();
  }
  //----------------- Subclass Modal ------------------//
  chooseSubclassFeatures(features) {
    this.removeAllChildNodes(this.subclassFeaturesModalListTarget);

    this.subclassFeaturesLimitTarget.innerText = 'Choose 1 of Each';

    features.forEach((item) => {
      if (parseInt(item[0]) <= this.level) {
        this.populateSubclassFeatureModal(item);
      }
    });
  }

  populateSubclassFeatureModal(feature) {
    let frame = document.createElement('div');
    //foreach element of feature[1] put a radio button
    frame.class = 'flex flex-col gap-2 p-2';

    let title = document.createElement('h4');
    title.class = 'text-center font-bold text-xl';
    title.innerText = `Level ${feature[0]}`;
    frame.append(title);
    feature[1].forEach((item) => {
      let container = document.createElement('div');
      container.class = 'flex gap-2 p-2';
      let check = document.createElement('input');
      check.type = 'checkbox';
      check.value = item;
      check.id = feature[0]; //for validation on submit
      container.append(check);
      container.append(item);
      frame.append(container);
    });
    this.subclassFeaturesModalListTarget.append(frame);
  }

  submitSubclassFeaturesChoices(event) {
    let chosen = [];
    this.subclassFeaturesModalListTarget.childNodes.forEach(
      (node) => {
        node.childNodes.forEach((subnode) => {
          let item = subnode.firstChild;
          if (item.type == 'checkbox' && item.checked) {
            chosen.push([item.id, item.value]);
          }
        });
      }
    );

    let check = [];
    let output = [];
    let validated = true;
    chosen.forEach((choice) => {
      if (check.includes(choice[0])) {
        validated = false;
      } else {
        check.push(choice[0]);
        output.push(choice[1]);
      }
    });

    if (validated) {
      this.putModalChecksToSheet(
        output,
        this.subclassFeaturesChoicesTarget,
        this.choices.get('subclass')
      );
      event.target.parentNode.close();
    }
  }
  //------------------ Level Up ASI Choices ------------//
  chooseASI() {
    let feature_nodes = this.classFeaturesTarget.children;
    let asi_nodes = Array.from(feature_nodes).filter(
      (node) => node.innerText == 'Ability Score Increase:'
    );

    this.populateASIModal(asi_nodes.length);
  }

  populateASIModal(length) {
    this.removeAllChildNodes(this.asiModalListTarget);

    let list = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];
    for (let i = 0; i < length; i++) {
      let container = this.getTag('div', 'asi-box');
      let choose_one = this.getTag('div', 'choice-box');
      let choose_two = this.getTag('div', 'choice-box');

      let select_one = this.getTag('select', 'rounded-sm');
      select_one.append(
        this.getTag('option', 'font-semibold', '+2 to stat')
      );
      for (let stat of list) {
        let option = this.getTag('option', 'font-semibold', stat);
        option.value = stat;
        select_one.append(option);
      }
      choose_one.append(select_one);

      let select_two = this.getTag('select', 'rounded-sm');
      let select_two_b = this.getTag('select', 'rounded-sm');
      select_two.append(
        this.getTag('option', 'font-semibold', '+1 to stat')
      );
      select_two_b.append(
        this.getTag('option', 'font-semibold', '+1 to stat')
      );
      for (let stat of list) {
        let option = this.getTag('option', 'font-semibold', stat);
        option.value = stat;
        let option2 = this.getTag('option', 'font-semibold', stat);
        select_two.append(option);
        select_two_b.append(option2);
      }
      choose_two.append(select_two);
      choose_two.append(select_two_b);

      let checkbox = this.getTag('input', '');
      checkbox.type = 'checkbox';
      choose_one.append(checkbox);

      let checkbox2 = this.getTag('input', '');
      checkbox2.type = 'checkbox';
      choose_two.prepend(checkbox2);

      container.append(choose_one);
      container.append(this.getTag('p', 'font-black font-lg', 'or'));
      container.append(choose_two);
      this.asiModalListTarget.append(container);
    }
  }

  submitASIChoices(event) {
    let choices = [];
    for (let row of this.asiModalListTarget.children) {
      let count = 0;
      let chosen = [];
      for (let item of row.children) {
        if (item.firstChild.tagName == 'SELECT') {
          if (item.lastChild.checked) {
            chosen = [item.firstChild.value];
            count++;
          }
        } else {
          if (item.firstChild.checked) {
            chosen = [item.children[1].value, item.children[2].value];
            count++;
          }
        }
      }
      if (count != 1) return;
      choices.push(chosen);
    }

    this.putASIToSheet(choices);
    event.target.parentNode.close();
  }

  putASIToSheet(choices) {
    let feature_nodes = this.classFeaturesTarget.children;
    let asi_nodes = Array.from(feature_nodes).filter(
      (node) => node.innerText == 'Ability Score Increase:'
    );
    let index = 0;
    for (let choice of choices) {
      if (choice.length == 1) {
        this.increaseStat(choice[0], 2);
      } else {
        this.increaseStat(choice[0]);
        this.increaseStat(choice[1]);
      }
      choice.forEach((stat) => {
        asi_nodes[index].append(this.expandStatName(stat));
      });
      index++;
    }
    this.updateStats();
    this.finalPass(1);
  }

  //----------------- TBIF Modal ------------------//
  chooseTBIF() {
    this.removeAllChildNodes(this.tbifModalListTarget);

    let kinds = [
      [this.traits, 'Traits'],
      [this.bonds, 'Bonds'],
      [this.ideals, 'Ideals'],
      [this.flaws, 'Flaws'],
    ];

    kinds.forEach((kind) => {
      let list = kind[0];
      let frame = document.createElement('div');
      frame.class = 'flex flex-col gap-2 p-2';

      let title = document.createElement('h4');
      title.class = 'text-center font-bold text-xl';
      title.innerText = kind[1];

      frame.append(title);
      //each with index over this.****
      for (let i = 0; i < list.length; i++) {
        let item = list[i];

        let container = document.createElement('div');
        container.class = 'flex gap-2 p-2';
        let check = document.createElement('input');
        check.type = 'checkbox';
        check.value = kind[1];
        check.id = i; //for validation on submit
        container.append(check);
        container.append(item);
        frame.append(container);
      }
      this.tbifModalListTarget.append(frame);
    });
  }

  submitTBIF(event) {
    let targets = [
      this.tbifTraitsTarget,
      this.tbifBondsTarget,
      this.tbifIdealsTarget,
      this.tbifFlawsTarget,
    ];
    let chosen = [];
    this.tbifModalListTarget.childNodes.forEach((node) => {
      node.childNodes.forEach((subnode) => {
        let item = subnode.firstChild;
        if (item.type == 'checkbox' && item.checked) {
          chosen.push([item.value, item.id]);
        }
      });
    });
    let check = [];
    let output = [];
    let validated = true;

    chosen.forEach((choice) => {
      if (check.includes(choice[0])) {
        validated = false;
      } else {
        check.push(choice[0]);
        output.push(choice[1]);
      }
    });

    if (validated) {
      this.putTraitsToSheet(output);
      event.target.parentNode.close();
    }
  }

  putTraitsToSheet(indexes) {
    //loop over targets and put this.***[index] to this.***Target
    //the order will always be the same due to sheet structure
    let targets = [
      [this.tbifTraitsTarget, this.traits],
      [this.tbifBondsTarget, this.bonds],
      [this.tbifIdealsTarget, this.ideals],
      [this.tbifFlawsTarget, this.flaws],
    ];

    targets.forEach((target) => {
      this.removeAllChildNodes(target[0]);
    });

    let i = 0;
    indexes.forEach((index) => {
      let tag = document.createElement('p');
      tag.class = 'text-center';
      tag.innerText = targets[i][1][index]; //this.***[index] is the text we want
      targets[i][0].append(tag);
      i++;
    });
  }
  //----------------- Spell Modal ------------------//
  chooseSpells() {
    let max_spell_level = 0;
    this.spell_table[this.level - 1].forEach((entry) => {
      if (entry > 0) max_spell_level++;
    });
    let num_spells = this.spell_table[this.level - 1][0];
    let num_cantrips = this.spell_table[this.level - 1][1];

    this.spellsLimitTarget.innerText = `Choose ${num_spells} spells.`;
    this.cantripLimitTarget.innerText = `Choose ${num_cantrips} cantrips.`;

    //populate the modal with headings and spells, with checkboxes
    this.populateSpellModal(max_spell_level);
  }

  populateSpellModal(max_level) {
    for (let i = 0; i <= max_level; i++) {
      let frame = document.createElement('div');
      //foreach element of feature[1] put a radio button
      frame.class = 'flex flex-col gap-2 p-2';

      let title = document.createElement('h4');
      title.classList.add('text-center', 'font-bold', 'text-xl');
      if (i == 0) {
        title.innerText = 'Cantrips';
      } else {
        title.innerText = `Level ${i}`;
      }
      frame.append(title);
      this.spellList.forEach((item) => {
        if (item.level == i) {
          let container = document.createElement('div');
          container.class = 'flex gap-2 p-2';
          let check = document.createElement('input');
          check.type = 'checkbox';
          check.value = item.level;
          check.id = item.id; //for validation on submit
          container.append(check);
          container.append(item.name);
          frame.append(container);
        }
      });
      this.spellsModalListTarget.append(frame);
    }
  }

  submitSpellsChoices(event) {
    let chosen = [];
    this.spellsModalListTarget.childNodes.forEach((frame) => {
      frame.childNodes.forEach((container) => {
        if (container.firstChild.checked) {
          chosen.push([
            container.firstChild.id, //db id
            container.firstChild.value, //spell level
          ]);
        }
      });
    });
    if (
      chosen.length <
      this.spell_table[this.level - 1][0] +
        this.spell_table[this.level - 1][1]
    ) {
      this.putSpellsToSheet(chosen);
      event.target.parentNode.close();
    }
  }

  //spells is an array of arrays [spell.id, spell.level]
  putSpellsToSheet(spells) {
    let targets = [
      this.spellsTaken0Target,
      this.spellsTaken1Target,
      this.spellsTaken2Target,
      this.spellsTaken3Target,
      this.spellsTaken4Target,
      this.spellsTaken5Target,
      this.spellsTaken6Target,
      this.spellsTaken7Target,
      this.spellsTaken8Target,
      this.spellsTaken9Target,
    ];

    spells.forEach((taken) => {
      this.spellList.forEach((spell) => {
        if (spell.id == taken[0])
          this.putSingleSpellTaken(spell, targets[spell.level]);
      });
    });
  }

  putSingleSpellTaken(spell, target) {
    let frame = document.createElement('div');
    frame.class = 'flex flex-col gap-1 bg-gray-100 rounded-lg p-2';
    let title = document.createElement('h4');
    title.class = 'font-bold text-xl';
    title.innerText = spell.name;
    frame.append(title);
    frame.append(spell.description);

    let dmg_out;
    Object.entries(spell.atk_dmg).forEach((level) => {
      if (parseInt(level[0]) <= this.level) dmg_out = level[1];
    });
    frame.append(`Attack Damage: ${dmg_out}`);
    target.append(frame);
  }
  //-----------------Equipment Modal ------------------//

  chooseEquipment() {
    let class_choices = false;
    let bg_choices = false;
    if (this.class_equip_choices['choices'].length > 0)
      class_choices = this.class_equip_choices['choices'];

    if (this.bg_equip_choices['choices'].length > 0)
      bg_choices = (this.bg_equip_choices['choices'], 'Background');

    if (class_choices) {
      this.populateEquipmentModal(
        class_choices,
        this.equipmentClassStartTarget,
        'Class'
      );
    } else {
      this.equipmentClassStartTarget.append(
        this.getTag(
          'p',
          'font-semibold p-4',
          'No choices for this class.'
        )
      );
    }
    if (bg_choices) {
      this.populateEquipmentModal(
        bg_choices,
        this.equipmentBGStartTarget,
        'Background'
      );
    } else {
      this.equipmentBGStartTarget.append(
        this.getTag(
          'p',
          'font-semibold p-4',
          'No choices for this background.'
        )
      );
    }
  }

  populateEquipmentModal(choices, target, title) {
    this.removeAllChildNodes(target);

    choices.forEach((choice) => {
      let number_of_choices = choice.length;
      let container = this.getTag('div', 'equipment-row');

      choice.forEach((code) => {
        let values = code.split('#');
        let choice_box = this.getTag('div', 'choice-box');
        container.append(choice_box);

        let choice_labels = this.getTag(
          'div',
          'flex gap-4 items-center justify-center'
        );
        choice_box.append(choice_labels);

        for (let i = 0; i < parseInt(values[1]); i++) {
          switch (values[0]) {
            case 'simple':
              this.appendWeaponSelectToTarget(
                'simple',
                choice_labels
              );
              break;
            case 'martial':
              this.appendWeaponSelectToTarget(
                'martial',
                choice_labels
              );
              break;
            default:
              choice_labels.append(
                this.getTag('p', 'p-1', values[0])
              );
              break;
          }
        }
        let checkbox = this.getTag('input', '');
        checkbox.type = 'checkbox';
        choice_box.prepend(checkbox);

        container.append(
          this.getTag('p', 'text-lg font-black', 'or')
        );
      });
      container.removeChild(container.lastChild); //get rid of last 'or'
      target.append(container);
    });
  }

  submitEquipmentChoices(event) {
    let rows = document.querySelectorAll('.equipment-row');
    let validated = true;
    let output = [];
    rows.forEach((row) => {
      let check = this.validateEquipmentRow(row);
      if (check) {
        check.forEach((item) => {
          output.push(item);
        });
      } else {
        validated = false;
      }
    });
    if (validated) {
      this.putEquipmentToSheet(output);
      event.target.parentNode.close();
    }
  }

  putEquipmentToSheet(equipment) {
    //output selections to character sheet
    this.removeAllChildNodes(this.startingEquipmentTarget);
    equipment.forEach((item) => {
      this.startingEquipmentTarget.append(
        this.getTag('p', 'font-medium', item)
      );
    });

    fetch(`/labels/index`)
      .then((response) => response.json())
      .then((data) => {
        console.table(data);
      });
  }

  // equipment utilities //

  //working select.value will be wep.id
  appendWeaponSelectToTarget(wep_type, target) {
    let selector = document.createElement('select');
    selector.id = 'testing';
    selector.className = 'rounded-md';
    let plate = document.createElement('option');
    let plate_title =
      wep_type.charAt(0).toUpperCase() +
      wep_type.slice(1) +
      ' Weapon';
    plate.innerText = `- ${plate_title} -`;
    selector.append(plate);

    fetch(`/weapons/${wep_type}`)
      .then((response) => response.json())
      .then((data) => {
        data.forEach((item) => {
          let option = document.createElement('option');
          option.value = item['name'];
          option.innerText = item['name'];
          selector.append(option);
        });
        target.append(selector);
      });
  }

  validateEquipmentRow(row) {
    let row_output;

    let count = 0;

    for (let choice_box of row.children) {
      if (choice_box.firstChild.checked) {
        count++;
        row_output = choice_box.lastChild;
      }
    }
    if (count != 1) {
      return false;
    }

    let validated_output = [];
    for (let item of row_output.children) {
      if (item.tagName == 'SELECT') {
        let text = item.value;
        validated_output.push(text);
      } else {
        validated_output.push(item.innerText);
      }
    }

    return validated_output;
  }

  //----------------- Modal Utilities ------------------//
  populateListModal(target, options) {
    options.forEach((option) => {
      let container = document.createElement('div');
      container.class = 'flex flex-col gap-2 p-2';

      let check = document.createElement('input');
      check.type = 'checkbox';
      check.value = option;

      container.append(check);
      container.append(option);

      target.appendChild(container);
    });
  }

  //add new choice buttons to the target list to activate them in finalPass
  activateButtons() {
    let buttons = [
      this.langButtonTarget,
      this.classSkillsButtonTarget,
      this.toolsButtonTarget,
      this.subclassButtonTarget,
      this.spellsButtonTarget,
      this.tbifButtonTarget,
      this.equipmentButtonTarget,
      this.asiButtonTarget,
    ];

    buttons.forEach((button) => {
      button.disabled = false;
      button.classList.remove(this.disabled_color);
      button.classList.add(this.active_color);
    });
  }

  deactivateButton(target) {
    target.disabled = true;
    target.classList.remove(this.active_color);
    target.classList.add(this.disabled_color);
  }

  //Modal display activation
  showLangDialog() {
    this.dialogLanguagesTarget.showModal();
  }
  showClassSkillsDialog() {
    this.dialogClassSkillsTarget.showModal();
  }
  showToolsDialog() {
    this.dialogToolsTarget.showModal();
  }
  showSubclassFeaturesDialog() {
    this.dialogSubclassFeaturesTarget.showModal();
  }
  showSpellsDialog() {
    this.dialogSpellsTarget.showModal();
  }
  showTBIFDialog() {
    this.dialogTBIFTarget.showModal();
  }
  showEquipmentDialog() {
    this.dialogEquipmentTarget.showModal();
  }
  showASIDialog() {
    this.dialogASITarget.showModal();
  }

  putModalChecksToSheet(collection, target, name = '') {
    //creates p tags for collection and appends list to target with label for category name
    //clears allChildfren of Target before appending so I use it in specific labele
    //we pass in a category instance, collection within it, and output target
    //if the collection is empty, the function returns without side-effects

    if (collection.length == 0 || target == null) return;

    this.removeAllChildNodes(target);

    if (name != '') {
      let tag = document.createElement('p');
      tag.classList.add('font-bold');
      tag.append(`${name}: `);
      target.append(tag);
    }

    collection.forEach((item) => {
      let l_item = document.createElement('p');
      l_item.append(item);
      target.append(l_item);
    });
  }

  //----------------------------- Base Stat Methods ---------------------------------//
  statModUpdate(runFinal = 0) {
    this.strModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[0])
    );
    this.dexModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[1])
    );
    this.conModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[2])
    );
    this.intModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[3])
    );
    this.wisModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[4])
    );
    this.chaModTarget.innerText = this.modWithSign(
      this.calcMod(this.stats[5])
    );

    if (this.isChoicesFull() && this.stats[0] != 0 && runFinal == 0) {
      this.finalPass();
    }
  }

  //call stat modifications here
  randomStats() {
    for (let i = 0; i < 6; i++) {
      let rand = Math.floor(Math.random() * 20) + 1;
      this.base_stats[i] = rand;
      this.stats[i] = this.base_stats[i];
    }

    if (this.raceASI != 0 && this.subraceASI != 0)
      this.calculateStats();

    this.updateStats();

    this.statModUpdate();
  }

  calculateStats() {
    let index = 0;
    for (let item of this.stats) {
      this.stats[index] =
        this.base_stats[index] +
        this.raceASI[index] +
        this.subraceASI[index];
      index++;
    }
  }
  updateStats() {
    this.strBaseTarget.innerText = this.stats[0];
    this.conBaseTarget.innerText = this.stats[2];
    this.dexBaseTarget.innerText = this.stats[1];
    this.intBaseTarget.innerText = this.stats[3];
    this.chaBaseTarget.innerText = this.stats[5];
    this.wisBaseTarget.innerText = this.stats[4];
  }

  //----------------------------- Utility Methods ---------------------------------//
  updateChoices() {
    //we'll call this whenever there's a change in the top form to update the state object this.choices
    //iterator replaces forEach on Map objects
    let iterchoice = this.choices.entries();

    //there are 6 choices to make
    for (let i = 0; i < this.choices.size; i++) {
      //we get the options for each form select in an HTMLCollection
      let label = iterchoice.next().value[0];
      let options = document.getElementById(label).children;

      //we have to use set and item to deal with the HTMLCollection
      //we won't set anything that is still on the label '- Whatever -'
      for (let j = 0; j < options.length; j++) {
        if (
          options.item(j).selected &&
          options.item(j).innerText.charAt(0) != '-'
        )
          this.choices.set(label, options.item(j).innerText);
      }
    }
  }

  putClassFeatures(name, collection, target) {
    //creates p tags for collection and appends list to target with label for category name
    //clears allChildfren of Target before appending so I use it in specific labele
    //we pass in a category instance, collection within it, and output target
    //if the collection is empty, the function returns without side-effects

    if (collection.length == 0 || target == null) return;
    //modified from above
    this.removeAllChildNodes(target);

    target.append(this.getPTag(name, 'font-black'));
    collection.forEach((item) => {
      //bold the feature label if it exists
      if (item.includes(':')) {
        let split = item.split(':');

        let l_item = document.createElement('p');
        let title = document.createElement('p');
        title.classList.add('font-semibold');

        title.append(split[0] + ':');
        l_item.append(split[1]);
        target.append(title);
        target.append(l_item);
      } else {
        let l_item = document.createElement('p');

        l_item.append(item);
        target.append(l_item);
      }
    });
  }

  removeAllChildNodes(parent) {
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }

  getPTag(string, classname = 'font-medium') {
    let out = document.createElement('p');
    out.className = classname;
    out.append(string + ': ');
    return out;
  }

  getTag(string, classname, content) {
    let out = document.createElement(string);
    out.className = classname;
    if (content) out.append(content);
    return out;
  }

  appendItemToTarget(item, target) {
    target.append(this.getPTag(item));
  }

  //calculate modifier
  calcMod(base) {
    return Math.floor(base / 2) - 5;
  }

  modWithSign(val) {
    let sign;
    if (val == 0) return '0';
    if (val < 0) return `${val}`;
    return `+${val}`;
  }

  expandStatName(stat) {
    switch (stat) {
      case 'STR':
        return 'Strength';
      case 'CON':
        return 'Constitution';
      case 'DEX':
        return 'Dexterity';
      case 'INT':
        return 'Intelligence';
      case 'WIS':
        return 'Wisdom';
      case 'CHA':
        return 'Charisma';
      default:
        return 'NaS';
    }
  }

  increaseStat(stat, val = 1) {
    switch (stat) {
      case 'STR':
        this.stats[0] += val;
        break;
      case 'CON':
        this.stats[2] += val;
        break;
      case 'DEX':
        this.stats[1] += val;
        break;
      case 'INT':
        this.stats[3] += val;
        break;
      case 'WIS':
        this.stats[4] += val;
        break;
      case 'CHA':
        this.stats[5] += val;
        break;
      default:
        return 'NaS';
    }
    return;
  }

  isChoicesFull() {
    let checklist = this.choices?.values();
    for (let i = 0; i < this.choices.size; i++) {
      let val = checklist.next().value;
      if (val == 'none' || val == 0) {
        return false;
      }
    }
    return true;
  }

  //returns a Map { category_names, [] }
  blankCategoryMap() {
    let categories = new Map();
    categories.set('race', []);
    categories.set('subrace', []);
    categories.set('player_class', []);
    categories.set('subclass', []);
    categories.set('background', []);
    categories.set('feats', []);
    return categories;
  }
}
