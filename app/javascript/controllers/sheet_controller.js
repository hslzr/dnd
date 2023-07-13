import { Controller } from '@hotwired/stimulus';
import * as Util from 'utilities';

//all options come from the db, new db additions should just work
export default class extends Controller {
  static targets = [
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
    'sleightofhandMod',
    'sleightofhandProf',
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
    'animalhandlingMod',
    'animalhandlingProf',
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
    'classFeaturesChoices',
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
    'castingAbility',
    'castingSaveDC',
    'castingAttackBonus',
    'castingSpellLimit',
    'castingCantripLimit',
    'spellsButton',
    'equipGP',
    'equipSP',
    'equipCP',
    'equipWeapons',
    'equipArmor',
    'equipTools',
    'equipEquipment',
    'dialogLanguages',
    'languagesModalList',
    'langLimit',
    'dialogClassSkills',
    'classSkillsModalList',
    'classSkillsLimit',
    'classfeaturesModalList',
    'classFeaturesLimit',
    'dialogClassFeatures',
    'classFeaturesButton',
    'dialogTools',
    'toolsModalList',
    'dialogSubclassFeatures',
    'subclassfeaturesModalList',
    'subclassFeaturesLimit',
    'dialogASI',
    'asiModalList',
    'customASI',
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
    'dialogExtraSpells',
    'extraSpellsModalList',
    'extraSpellsLimit',
    'extraSpellsButton',
    'tbifTraits',
    'tbifBonds',
    'tbifIdeals',
    'tbifFlaws',
    'traitsModalList',
    'dialogTraits',
    'tbifButton',
    'equipmentModalList',
    'dialogEquipment',
    'equipmentClassStart',
    'equipmentBGStart',
    'equipmentButton',
    'atkNames',
    'attackBonuses',
    'attackDamages',
    'attackProps',
    'attackList',
    'extraSkillsModalList',
    'modSkills',
    'specSpellsList',
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

    this.button_targets = [
      this.langButtonTarget,
      this.classSkillsButtonTarget,
      this.classFeaturesButtonTarget,
      this.toolsButtonTarget,
      this.subclassButtonTarget,
      this.spellsButtonTarget,
      this.tbifButtonTarget,
      this.equipmentButtonTarget,
      this.asiButtonTarget,
      this.extraSpellsButtonTarget,
    ];

    this.stats = [0, 0, 0, 0, 0, 0];
    //store initial stats here, modify and collate in this.stats
    this.base_stats = [0, 0, 0, 0, 0, 0];
    this.stat_targets = [
      this.strBaseTarget,
      this.dexBaseTarget,
      this.conBaseTarget,
      this.intBaseTarget,
      this.wisBaseTarget,
      this.chaBaseTarget,
    ];

    ///set on level update in catHandler
    this.prof_mod;
    ///set on class form select
    this.spellcasting_ability;

    //used for selection and updating
    this.skills = new Map(); //initialized later in setSkillMap(), a collection of targets
    //i feel like I could save a lot of effort if I used these better
    this.languages = Util.blankCategoryMap();
    this.extra_languages = Util.blankCategoryMap();
    this.tools = Util.blankCategoryMap();
    this.weapons = Util.blankCategoryMap();
    this.armor = Util.blankCategoryMap();
    this.features = Util.blankCategoryMap();

    this.classSkillChoices; //set in catUpdate
    this.allSkillChoices = [
      'Acrobatics',
      'Animal Handling',
      'Arcana',
      'Athletics',
      'Deception',
      'History',
      'Insight',
      'Intimidation',
      'Investigation',
      'Medicine',
      'Nature',
      'Perception',
      'Performance',
      'Persuasion',
      'Religion',
      'Sleight of Hand',
      'Stealth',
      'Survival',
    ];
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
    this.hit_die; //for hp calc in finalPass

    //button colors
    this.disabled_color = 'bg-orange-300';
    this.active_color = 'bg-blue-400';

    //locking modals until their content is able to be populated
    this.langButtonTarget.disabled = true;
    this.classSkillsButtonTarget.disabled = true;

    //equipped armor list, we have to add shields to equipped armor if both present and a 1 handed weapon is in inventory
    this.equipped_armor = [];

    //spells
    this.spellList = false; //we'll set this to a correct collection of Class Spells with a new fetch in catUpdate
    this.extraSpellLists = Util.blankCategoryMap();
    this.specificSpells = Util.blankCategoryMap(); //catUpdate fills these 2 with all categories associated spellists/spells
    this.validatedExtraSpells = []; //we'll set this once the extra spells modal is prepped since we have the needed info
    this.allSpells = false;
    this.allSpellList = [];

    this.chosenExtras = [];
    this.chosenClassSpells = []; //for sheet output duplicate removal

    //customModifiers
    this.customMods = Util.blankCategoryMap();
  }

  //----------------------------- Main Sheet Update Flow ---------------------------------//
  categoryHandler(event) {
    //consoel.log('categoryHandler');
    let labels = event.params;
    let list = event.target.children;
    Util.updateChoices(this.choices);

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
    //consoel.log('catUpdate');
    //event.target.id is actually the :name param
    let languages, extra_lang, skills, weps, arm, tools, features;
    let finalCode = 0;

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

        Util.removeAllChildNodes(this.racialASIBonusTarget);
        this.racialASIBonusTarget.append(
          Util.getTag(
            'p',
            'font-black col-span-2 text-center mt-2',
            data.name
          )
        );
        Util.putRacialASI(this.raceASI, this.racialASIBonusTarget);

        //we have to handle races with no subrace by assigning the blank subrace here
        if (data.sub_count == 0) {
          this.aboutSubraceTarget.innerText = '';
          this.sheet_subrace = 'None';
          this.subraceASI = [0, 0, 0, 0, 0, 0];

          Util.removeAllChildNodes(this.subraceASIBonusTarget);
          this.choices.set('subrace', 'None');
        }
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

        Util.removeAllChildNodes(this.subraceASIBonusTarget);
        this.subraceASIBonusTarget.append(
          Util.getTag(
            'p',
            'font-black col-span-2 text-center mt-2',
            data.name
          )
        );
        Util.putRacialASI(
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
        this.classFeatureChoices = data.custom;
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
        } else {
          this.spellList = false;
          //i reset the fields here in case it's been switched from another class
          this.castingAbilityTarget.innerText = '';
          this.castingSaveDCTarget.innerText = '';
          this.castingAttackBonusTarget.innerText = '';
          this.castingSpellLimitTarget.innerText = '';
          this.castingCantripLimitTarget.innerText = '';
          Util.removeAllChildNodes(this.spellsTaken0Target);
          Util.removeAllChildNodes(this.spellsTaken1Target);
          Util.removeAllChildNodes(this.spellsTaken2Target);
          Util.removeAllChildNodes(this.spellsTaken3Target);
          Util.removeAllChildNodes(this.spellsTaken4Target);
          Util.removeAllChildNodes(this.spellsTaken5Target);
          Util.removeAllChildNodes(this.spellsTaken6Target);
          Util.removeAllChildNodes(this.spellsTaken7Target);
          Util.removeAllChildNodes(this.spellsTaken8Target);
          Util.removeAllChildNodes(this.spellsTaken9Target);
          this.spellSlots1Target.innerText = 0;
          this.spellSlots2Target.innerText = 0;
          this.spellSlots3Target.innerText = 0;
          this.spellSlots4Target.innerText = 0;
          this.spellSlots5Target.innerText = 0;
          this.spellSlots6Target.innerText = 0;
          this.spellSlots7Target.innerText = 0;
          this.spellSlots8Target.innerText = 0;
          this.spellSlots9Target.innerText = 0;
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
      case 'asi':
        finalCode = 1;
        break;
      default:
        break;
    }

    //don't try to set abilities to the sheet if we only set the character level
    if (
      cat_type != 'level' &&
      cat_type != 'stats' &&
      cat_type != 'asi'
    ) {
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

    //if we have both ASI adjustments, apply them
    if (
      this.raceASI != 0 &&
      this.subraceASI != 0 &&
      cat_type != 'asi'
    ) {
      Util.calculateStats(
        this.stats,
        this.base_stats,
        this.raceASI,
        this.subraceASI
      );
      Util.updateStats(this.stat_targets, this.stats);
      this.statModUpdate();
    }

    //check for form completion on every change
    if (
      Util.isChoicesFull(this.choices) &&
      this.stats.reduce((x, y) => x + y, 0) > 20 //making sure stats have been assigned
    ) {
      this.finalPass(finalCode);
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
    //consoel.log('populateCatAbilities');
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

    let data_extra_spells = data.extra_spells || [];
    this.extraSpellLists.set(cat_type, data_extra_spells);

    let data_spec_spells = data.specific_spells || [];
    this.specificSpells.set(cat_type, data_spec_spells);

    let data_custom_mods = data.custom_mods || [];
    this.customMods.set(cat_type, data_custom_mods);

    //we output the needed <p></p> tags to the given target
    Util.putClassFeatures(data.name, data_lang, languages);
    Util.putClassFeatures(data.name, data_weps, weps);
    Util.putClassFeatures(data.name, data_arm, arm);
    Util.putClassFeatures(data.name, data_tools, tools);

    //class and subclass features will be set in finalPass after level is set
    if (cat_type != 'player_class') {
      //these are choices for a class
      Util.putClassFeatures(data.name, data_skills, skills);
      if (cat_type != 'subclass')
        Util.putClassFeatures(data.name, data_features, features);
    }
  }

  //code 0 : run everything
  //code 1 : dont run updatetats or statModUpdate
  finalPass(code = 0) {
    //consoel.log('finalPass');

    //consoel.log(code);

    this.setSkillMap();
    this.populateSkillModifiers();
    this.classFeatureHandler(); //we depend on level to show correct class features so we have to do these in finalPass
    this.subclassFeatureHandler();

    //recalculate stats, code 2 used in putASIToSheet(), we are modifying stats so we don't want to recalculate them after
    Util.calculateStats(
      this.stats,
      this.base_stats,
      this.raceASI,
      this.subraceASI
    );

    //catUpdate passes a 1 if cat_type == 'asi' we dont want to run over our changes with these functions
    if (code == 0) {
      Util.updateStats(this.stat_targets, this.stats);
      this.statModUpdate();
    }

    this.passPerceptionTarget.innerText =
      Util.calcMod(this.stats[4]) + 10;

    this.substatInitiativeTarget.innerText =
      this.dexModTarget.innerText;

    this.trackingMaxHPTarget.innerText =
      Util.calcMod(this.stats[2]) * this.level +
      parseInt(this.hit_die) +
      (this.level - 1) * Math.floor(this.hit_die / 2);

    if (!this.equipArmorTarget.hasChildNodes()) {
      this.substatACTarget.innerText =
        10 + Util.calcMod(this.stats[1]);
    }

    this.trackingHitDiceTarget.innerText = `${this.level}d${this.hit_die}`;

    if (this.stats.reduce((x, y) => x + y, 0) > 6) {
      Util.activateButtons(
        this.button_targets,
        this.active_color,
        this.disabled_color
      );

      //running these on a non-spellcasting class breaks stuff
      if (this.spellcasting_ability == 0) {
        Util.deactivateButton(
          this.spellsButtonTarget,
          this.active_color,
          this.disabled_color
        );
      } else {
        this.setSpellInformation();
      }
      this.populateSpecificSpells();
      this.makeModalChoices();
    }

    this.resetProficiencies();
    this.customModifiers();
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
      this.sleightofhandModTarget,
      this.sleightofhandProfTarget,
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
      this.animalhandlingModTarget,
      this.animalhandlingProfTarget,
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
  } //utility but depends on stats being assigned and too many targets to separate

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
        bonuses[i] + Util.calcMod(this.stats[i]);
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

    Util.putClassFeatures(
      this.choices.get('player_class'),
      classFeatures,
      this.classFeaturesTarget
    );

    let classChoices = [];
    this.nochoices = true;

    if (this.classFeatureChoices != {}) {
      this.chooseClassFeatures(
        Object.entries(this.classFeatureChoices)
      );
      this.nochoices = false;
    }

    Object.entries(this.classFeatureList).forEach((entry) => {
      if (parseInt(entry[0]) <= this.level) {
        entry[1].forEach((entry) => {
          classChoices.push(entry);
        });
      }
    });

    Util.putClassFeatures(
      this.choices.get('player_class'),
      classChoices,
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

    Util.putClassFeatures(
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
      let bonus = Util.calcMod(value[0]);
      if (Array.from(value[2].classList).includes('bg-black'))
        bonus += this.prof_mod;
      if (Array.from(value[2].classList).includes('bg-white'))
        bonus += this.prof_mod * 2;
      value[1].innerText = bonus;
    }
  }

  setSpellInformation() {
    let spell_mod = Util.calcMod(
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

    for (let i = 2; i < 11; i++) {
      slot_targets[i - 2].innerText =
        this.spell_table[this.level - 1][i];
      //using i+2 because the first two indexes are spells known and cantrips known
    }
  }

  populateSpecificSpells() {
    console.log(this.specificSpells);
    for (let item of this.specificSpells.values()) {
      if (item.source) {
        let valid = [];
        for (let value of Object.keys(item)) {
          if (value != 'source' && value != 'stat') {
            if (parseInt(value) <= this.level) {
              item[value].forEach((spell) => {
                valid.push(spell);
              });
            }
          }
        }
        let frame = Util.getSpellCard(item.source, item.stat, valid);

        this.specSpellsListTarget.append(frame);
      }
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
    this.chooseExtraSpells();
  }

  resetProficiencies() {
    let sources = [
      this.raceSkillsTarget,
      this.subraceSkillsTarget,
      this.classSkillsTarget,
      this.subclassSkillsTarget,
      this.backgroundSkillsTarget,
      this.featSkillsTarget,
      this.modSkillsTarget,
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

  customModifiers() {
    let keys = this.customMods.keys();
    for (let key of keys) {
      let mods = this.customMods.get(key); //we loop over every custom_mods assigned

      //hp modifier on hill dwarf as this.level
      let hp_bonus = eval(mods['hp']) || 0;
      let temp = parseInt(this.trackingMaxHPTarget.innerText);
      this.trackingMaxHPTarget.innerText = parseInt(hp_bonus) + temp;

      //speed
      let speed = mods['speed'] || false;
      if (speed) this.substatSpeedTarget.innerText = speed;

      //attacks
      let attacks = mods['attacks'] || false;
      if (attacks) {
        //clear attacks
        while (this.attackListTarget.children.length > 2) {
          this.attackListTarget.removeChild(
            this.attackListTarget.lastChild
          );
        }

        //populate attacks
        for (let attack of attacks) {
          let damage;
          for (let item of attack['damage']) {
            if (item[0] <= this.level) damage = item[1];
          }

          this.populateModAttack(
            attack['name'],
            damage,
            attack['dmg_type'],
            eval(attack['properties']),
            attack['bonus']
          );
        }
      }

      //ability score increases, select 1
      let custom_asi = mods['extra_asi'] || false;
      if (custom_asi) {
        Util.removeAllChildNodes(this.customASITarget);
        this.populateModASI(custom_asi);
      }

      //extra proficieny selections
      let extra_profs = mods['extra_profs'] || false;
      if (extra_profs) {
        this.populateExtraSkillsModal(extra_profs);
      }

      //seed passes in type of equipment and a number, we put a select box with equip of that type
      let extra_equipment = mods['extra_equip'] || false;
      if (extra_equipment) {
        console.log('extra equipment');
        extra_equipment
        this.equipmentModalListTarget.firstChild.append()
      }
    }
  }

  //------------------------------- customModifiers() methods
  populateModASI(length) {
    //consoel.log('populateModASI');
    let list = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];
    for (let i = 0; i < length; i++) {
      let container = Util.getTag('div', 'asi-box');
      let choose_one = Util.getTag('div', 'choice-box');

      let select_one = Util.getTag('select', 'rounded-sm');
      select_one.append(
        Util.getTag('option', 'font-semibold', '+1 to stat')
      );
      for (let stat of list) {
        let option = Util.getTag('option', 'font-semibold', stat);
        option.value = stat;
        select_one.append(option);
      }
      choose_one.append(select_one);

      let checkbox = Util.getTag('input', '');
      checkbox.type = 'checkbox';
      choose_one.append(checkbox);

      container.append(choose_one);
      this.customASITarget.append(container);
    }
  }

  populateExtraSkillsModal(array) {
    Util.removeAllChildNodes(this.extraSkillsModalListTarget);
    //consoel.log(array);
    let count = 0;
    for (let item of array) {
      if (item[0] <= this.level) count += item[1];
    }
    if (count == 0) {
      //consoel.log('no extras');
    }

    for (let j = 0; j < count; j++) {
      Util.putSelect(
        'Skills',
        this.allSkillChoices,
        this.extraSkillsModalListTarget
      );
    }
  }

  submitExtraSkillsChoices() {
    Util.removeAllChildNodes(this.modSkillsTarget);

    let chosen = [];
    //the checkboxes are wrapped in a span for alignment
    this.extraSkillsModalListTarget.childNodes.forEach((node) => {
      chosen.push(node.value);
    });
    Util.putModalChecksToSheet(
      chosen,
      this.modSkillsTarget,
      'Extra Skills'
    );
    //not called beacuse we are calling this from within a different submit button
    //event.target.parentNode.close();
    //this.resetProficiencies();
  }
  //----------------------------- Choice Modals ---------------------------------//
  //----------------- Languages Modal ------------------//
  chooseLanguages() {
    //consoel.log('chooseLanguages');
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

    Util.removeAllChildNodes(this.languagesModalListTarget);

    //make a list of languages already on the sheet
    var list = [];
    this.raceLanguagesTarget.childNodes.forEach((node) => {
      let text = node.innerText;
      if (text.slice(-1) != ':') list.push(text); //this eliminates labels like Dwarf:
    });
    this.subraceLanguagesTarget.childNodes.forEach((node) => {
      let text = node.innerText;
      if (text.slice(-1) != ':') list.push(text);
    });

    //indexOf returns -1 if lang not found in race/subrace languages list, we make those into options
    let options = allLanguages.filter(
      (lang) => list.indexOf(lang) === -1
    );

    //loop through the categoryMap and add up the extra languages from each category
    let init = 0;
    let temp;
    let lang_iter = this.extra_languages.values();
    for (let i = 0; i < this.extra_languages.size; i++) {
      temp = lang_iter.next().value;
      //skip empty objects
      if (typeof temp === 'string') init += parseInt(temp);
    }

    for (let j = 0; j < init; j++) {
      Util.putSelect(
        'Languages',
        options,
        this.languagesModalListTarget
      );
    }
  }

  submitLanguagesChoices(event) {
    Util.removeAllChildNodes(this.extraLanguagesTarget);
    //we clear the output here, all we have to do is limit the number of boxes you can check

    let chosen = [];
    //the checkboxes are wrapped in a span for alignment
    this.languagesModalListTarget.childNodes.forEach((node) => {
      chosen.push(node.value);
    });
    Util.putModalChecksToSheet(chosen, this.extraLanguagesTarget);
    event.target.parentNode.close();
  }
  //----------------- Tools Modal ------------------//
  chooseTools() {
    //consoel.log('chooseTools');
    Util.removeAllChildNodes(this.toolsModalListTarget);

    Util.putSelect(
      'Tools',
      this.raceToolChoices,
      this.toolsModalListTarget
    );
  }

  submitToolsChoices() {
    Util.removeAllChildNodes(this.raceToolsTarget);
    let racename = this.choices.get('race');
    let chosen = [];
    //the checkboxes are wrapped in a span for alignment
    this.toolsModalListTarget.childNodes.forEach((node) => {
      chosen.push(node.value);
    });
    Util.putModalChecksToSheet(
      chosen,
      this.raceToolsTarget,
      racename
    );
    event.target.parentNode.close();
  }
  //----------------- Class Skills Modal ------------------//
  chooseClassSkills() {
    //consoel.log('chooseCLassSkills');
    Util.removeAllChildNodes(this.classSkillsModalListTarget);

    for (let i = 0; i < this.numClassSkillChoices; i++) {
      Util.putSelect(
        'Skills',
        this.classSkillChoices,
        this.classSkillsModalListTarget
      );
    }
  }

  submitClassSkillsChoices(event) {
    Util.removeAllChildNodes(this.classSkillsTarget);

    let chosen = [];
    //the checkboxes are wrapped in a span for alignment
    this.classSkillsModalListTarget.childNodes.forEach((node) => {
      chosen.push(node.value);
    });
    Util.putModalChecksToSheet(
      chosen,
      this.classSkillsTarget,
      this.choices.get('player_class')
    );

    this.submitExtraSkillsChoices();

    event.target.parentNode.close();
    this.resetProficiencies();
  }

  //----------------- Class Features Modal ------------------//
  chooseClassFeatures(features) {
    //consoel.log('chooseClassFeatures');
    Util.removeAllChildNodes(this.classfeaturesModalListTarget);
    features.forEach((item) => {
      if (parseInt(item[0]) <= this.level) {
        this.populateOptionalFeatureModal(
          item,
          this.classfeaturesModalListTarget
        );
      }
    });
  }

  submitClassFeaturesChoices(event) {
    let chosen = [];
    this.classfeaturesModalListTarget.childNodes.forEach((node) => {
      node.childNodes.forEach((subnode) => {
        let item = subnode.firstChild;
        if (item.type == 'checkbox' && item.checked) {
          chosen.push([item.id, item.value]);
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
      Util.putModalChecksToSheet(
        output,
        this.classFeaturesChoicesTarget,
        this.choices.get('player_class')
      );
      event.target.parentNode.close();
    }
  }
  //----------------- Subclass Modal ------------------//
  chooseSubclassFeatures(features) {
    //consoel.log('chooseSubclassFeatures');
    Util.removeAllChildNodes(this.subclassfeaturesModalListTarget);
    features.forEach((item) => {
      if (parseInt(item[0]) <= this.level) {
        this.populateOptionalFeatureModal(
          item,
          this.subclassfeaturesModalListTarget
        );
      }
    });
  }

  populateOptionalFeatureModal(feature, target) {
    let frame = Util.getTag('div', 'flex flex-col gap-2 p-2');
    let title = Util.getTag(
      'h4',
      'text-center font-bold text-xl',
      `Level ${feature[0]}`
    );
    frame.append(title);

    feature[1].forEach((item) => {
      let container = Util.getTag('div', 'flex gap-2 p-2');
      let check = document.createElement('input');
      check.type = 'checkbox';
      check.value = item;
      check.id = feature[0]; //for validation on submit
      container.append(check);
      container.append(item);
      frame.append(container);
    });
    target.append(frame);
  }

  submitSubclassFeaturesChoices(event) {
    let chosen = [];
    this.subclassfeaturesModalListTarget.childNodes.forEach(
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
      Util.putModalChecksToSheet(
        output,
        this.subclassFeaturesChoicesTarget,
        this.choices.get('subclass')
      );
      event.target.parentNode.close();
    }
  }
  //------------------ Level Up ASI Choices ------------//
  chooseASI() {
    //consoel.log('chooseASI');
    let feature_nodes = this.classFeaturesTarget.children;
    let asi_nodes = Array.from(feature_nodes).filter(
      (node) => node.innerText == 'Ability Score Increase:'
    );

    this.populateASIModal(asi_nodes.length);
  }

  populateASIModal(length) {
    Util.removeAllChildNodes(this.asiModalListTarget);

    let list = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];
    for (let i = 0; i < length; i++) {
      let container = Util.getTag('div', 'asi-box');
      let choose_one = Util.getTag('div', 'choice-box');
      let choose_two = Util.getTag('div', 'choice-box');

      let select_one = Util.getTag('select', 'rounded-sm');
      select_one.append(
        Util.getTag('option', 'font-semibold', '+2 to stat')
      );
      for (let stat of list) {
        let option = Util.getTag('option', 'font-semibold', stat);
        option.value = stat;
        select_one.append(option);
      }
      choose_one.append(select_one);

      let select_two = Util.getTag('select', 'rounded-sm');
      let select_two_b = Util.getTag('select', 'rounded-sm');
      select_two.append(
        Util.getTag('option', 'font-semibold', '+1 to stat')
      );
      select_two_b.append(
        Util.getTag('option', 'font-semibold', '+1 to stat')
      );
      for (let stat of list) {
        let option = Util.getTag('option', 'font-semibold', stat);
        option.value = stat;
        let option2 = Util.getTag('option', 'font-semibold', stat);
        select_two.append(option);
        select_two_b.append(option2);
      }
      choose_two.append(select_two);
      choose_two.append(select_two_b);

      let checkbox = Util.getTag('input', '');
      checkbox.type = 'checkbox';
      choose_one.append(checkbox);

      let checkbox2 = Util.getTag('input', '');
      checkbox2.type = 'checkbox';
      choose_two.prepend(checkbox2);

      container.append(choose_one);
      container.append(Util.getTag('p', 'font-black font-lg', 'or'));
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
            chosen = [item.firstChild.value, 2];
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

    for (let row of this.customASITarget.children) {
      let chosen = [];
      for (let item of row.children) {
        chosen = [item.firstChild.value, 1];
      }
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
      if (choice[1] == 1 || choice[1] == 2) {
        this.stats = Util.increaseStat(
          this.stats,
          choice[0],
          choice[1]
        );
      } else {
        this.stats = Util.increaseStat(this.stats, choice[0]);
        this.stats = Util.increaseStat(this.stats, choice[1]);
      }

      //we want to skip the choices added by customASI
      if (index < asi_nodes.length) {
        //this appends the chosen stat names to the feature list entries showing 'Ability Score Increase:'
        choice.forEach((stat) => {
          asi_nodes[index].append(Util.expandStatName(stat));
        });
      }
      index++;
    }
    Util.updateStats(this.stat_targets, this.stats);
    this.statModUpdate();
    this.catUpdate({}, 'asi');
  }

  //----------------- TBIF Modal ------------------//
  chooseTBIF() {
    //consoel.log('chooseTBIF');
    Util.removeAllChildNodes(this.traitsModalListTarget);

    let kinds = [
      [this.traits, 'Traits'],
      [this.bonds, 'Bonds'],
      [this.ideals, 'Ideals'],
      [this.flaws, 'Flaws'],
    ];

    kinds.forEach((kind) => {
      let list = kind[0];
      let frame = Util.getTag('div', 'flex flex-col gap-2 p-2');
      let title = Util.getTag(
        'h4',
        'text-center font-bold text-xl',
        kind[1]
      );
      frame.append(title);
      //each with index over this.****
      for (let i = 0; i < list.length; i++) {
        let item = list[i];

        let container = Util.getTag('div', 'flex gap-2 p-2');
        let check = document.createElement('input');
        check.type = 'checkbox';
        check.value = kind[1];
        check.id = i; //for validation on submit
        container.append(check);
        container.append(item);
        frame.append(container);
      }
      this.traitsModalListTarget.append(frame);
    });
  }

  submitTraitsChoices(event) {
    let targets = [
      this.tbifTraitsTarget,
      this.tbifBondsTarget,
      this.tbifIdealsTarget,
      this.tbifFlawsTarget,
    ];
    let chosen = [];
    this.traitsModalListTarget.childNodes.forEach((node) => {
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
      Util.removeAllChildNodes(target[0]);
    });

    let i = 0;
    indexes.forEach((index) => {
      let tag = Util.getTag('p', 'text-center', targets[i][1][index]); //this.***[index] is the text we want
      targets[i][0].append(tag);
      i++;
    });
  }
  //----------------- Spell Modal ------------------//
  chooseSpells() {
    //consoel.log('chooseSpells');
    let max_spell_level = 0;
    for (let i = 2; i < 11; i++) {
      if (this.spell_table[this.level - 1][i] > 0) max_spell_level++;
    }
    //first two are informational, not spell slot amounts

    let num_spells = this.spell_table[this.level - 1][0];
    let num_cantrips = this.spell_table[this.level - 1][1];

    this.spellsLimitTarget.innerText = `Choose ${num_spells} spells.`;
    this.cantripLimitTarget.innerText = `Choose ${num_cantrips} cantrips.`;

    //populate the modal with headings and spells, with checkboxes
    this.populateSpellModal(max_spell_level);
  }

  populateSpellModal(max_level) {

    //clear it first of the old sheet if we are switching
    Util.removeAllChildNodes(this.spellsModalListTarget);
    for (let i = 0; i <= max_level; i++) {
      let frame = Util.getTag('div', 'flex flex-col gap-2 p-2');
      let title = Util.getTag('h4', 'text-center font-bold text-xl');

      if (i == 0) {
        title.innerText = 'Cantrips';
      } else {
        title.innerText = `Level ${i}`;
      }
      frame.append(title);
      this.spellList.forEach((item) => {
        if (item.level == i) {
          let container = Util.getTag('div', 'flex gap-2 p-2');
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
      chosen.length <=
      this.spell_table[this.level - 1][0] +
        this.spell_table[this.level - 1][1]
    ) {
      this.chosenClassSpells = chosen;
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
      if (!Util.subarrayMatch(this.chosenExtras, taken)) {
        this.spellList.forEach((spell) => {
          if (spell.id == taken[0])
            this.putSingleSpellTaken(spell, targets[spell.level]);
        });
      }
    });
  }

  putSingleSpellTaken(spell, target) {

    function getRow(tag, content) {
      let row = Util.getTag('div','rounded-lg bg-gray-300 px-8 flex justify-start gap-4');
      row.append(Util.getTag('p','font-black',tag));
      row.append(Util.getTag('p','',content));
      return row;
    }

    console.log(spell);
    let frame = Util.getTag(
      'div',
      'flex flex-col gap-1 bg-gray-100 rounded-lg p-2'
    );
    let title = Util.getTag('h4', 'font-bold text-xl', spell.name);
    frame.append(title);
    let splitter = spell.description.split('\n');

    frame.append(getRow('Level: ', spell.level));
    frame.append(getRow('Cast Time: ', spell.cast_time ));
    frame.append(getRow('Range: ', spell.range));
    frame.append(getRow('Components: ', spell.components.join(', ')));
    frame.append(getRow('Duration: ', spell.duration));
    if(spell.attack != 'false') {
      let dmg_out;
      Object.entries(spell.atk_dmg).forEach((level) => {
        if (parseInt(level[0]) <= this.level) dmg_out = level[1];
      });
      frame.append(getRow('Damage: ',`${dmg_out} ${spell.dmg_type}`));
    }
    frame.append(getRow('Description: ',splitter[0]));
    
    
    target.append(frame);
  }
  //-----------------Extra Spells Modal ------------------//
  chooseExtraSpells() {
    //consoel.log('chooseExtraSpells');
    //at this point we are in finalPass and our state variables are populated
    //check for an empty collection to skip all this stuff for classes without extra spell lists
    //we have to go through each collection, fetch the data needed, and populate the sheet or modal

    //prep the modal by filling in spell slot information

    this.prepExtraSpellsModal();

    let max_spell_level = 0;
    for (let i = 2; i < 11; i++) {
      if (this.spell_table[this.level - 1][i] > 0) max_spell_level++;
    }

    //first two entries are informational, not numbers of spell slots

    //fetch each spell list in extra SpellLists
    let lists = this.extraSpellLists.values();

    for (let item of lists) {
      let listkeys = Object.keys(item);

      for (let key of listkeys) {
        let details = item[key];

        if (key == 'Any') {
          fetch(`/labels/anyspell`)
            .then((response) => response.json())
            .then((data) => {
              this.populateExtraSpellsModal(
                data,
                details,
                key,
                max_spell_level
              );
              this.allSpells = true;
              this.allSpellList = data;
            });
        } else {
          fetch(`/class_spell_lists/${key}`)
            .then((response) => response.json())
            .then((data) => {
              this.populateExtraSpellsModal(
                data,
                details,
                key,
                max_spell_level
              );
              this.validatedExtraSpells.push(data);
            });
          //use those to populate the extra spells modal
        }
      }
    }
    //specificSpells get put straight to the sheet if level is high enough for them in a separate function
    //we send the right info to populateExtraSpells at this point
    this.validatedExtraSpells = [
      ...new Set(this.validatedExtraSpells),
    ]; //eliminate duplicates
  }

  //error in calculating spell slots, chooses wrong index
  prepExtraSpellsModal() {
    //we clear it here because populateExtraSpellsModal() will be called several times
    Util.removeAllChildNodes(this.extraSpellsModalListTarget);

    let slotframe = Util.getTag(
      'div',
      'w-full p-2 rounded-md border border-black grid grid-cols-10 grid-rows-3 mt-4 mb-2'
    );
    slotframe.append(
      Util.getTag(
        'p',
        'col-span-10 text-sm font-black text-center',
        'Slots'
      )
    );
    slotframe.append(
      Util.getTag(
        'p',
        'border-b border-black text-center p-1',
        'Cantrips'
      )
    );
    for (let i = 1; i < 10; i++) {
      slotframe.append(
        Util.getTag(
          'p',
          'border-b border-black text-center p-1',
          `${i}`
        )
      );
    }

    slotframe.append(
      Util.getTag(
        'p',
        'border-t border-black text-center p-1',
        this.spell_table[this.level - 1][1]
      )
    );

    for (let i = 2; i < 11; i++) {
      slotframe.append(
        Util.getTag(
          'p',
          'border-t border-black text-center p-1',
          this.spell_table[this.level - 1][i]
        )
      );
      //using i+2 because the first two indexes are spells known and cantrips known
    }
    this.extraSpellsModalListTarget.append(slotframe);
  }

  populateExtraSpellsModal(
    spells,
    feature_details,
    spell_list_name,
    max_spell_level
  ) {
    //limit text and shortcut to depopulate ineligible features for level
    let limit = 0;
    if (feature_details['spells_choices'] == 0) {
      for (let item of feature_details['cantrips_choices']) {
        if (this.level >= item[0]) limit += item[1];
      }
    } else {
      for (let item of feature_details['spells_choices']) {
        if (this.level >= item[0]) limit += item[1];
      }
    }

    if (limit == 0) return;

    let list_frame = Util.getTag(
      'div',
      'grid grid-cols-3 gap-2 p-2 rounded-lg bg-blue-300/50'
    );
    list_frame.append(
      Util.getTag(
        'p',
        'col-span-3 text-center rounded-md font-black text-2xl',
        feature_details['source']
      )
    );

    let info = Util.getTag(
      'div',
      'col-span-3 grid grid-cols-2 flex gap-2 items-center justify-evenly'
    );

    info.append(
      Util.getTag(
        'p',
        'text-center col-span-2 font-black text-sm -mt-2',
        `Choose ${limit}`
      )
    );

    info.append(
      Util.getTag(
        'p',
        'text-center font-semibold',
        `${spell_list_name} Spell List`
      )
    );
    info.append(
      Util.getTag(
        'p',
        'text-center font-semibold',
        `Spellcasting Stat:  ${feature_details['spell_ability']}`
      )
    );

    list_frame.append(info);

    //limit output to cantrips if appropriate
    if (feature_details['spells_choices'] == 0) max_spell_level = 0;

    for (let i = 0; i <= max_spell_level; i++) {
      let innerframe = Util.getTag(
        'div',
        'col-span-3 grid grid-cols-2 md:grid-cols-3 gap-2 p-2'
      );
      let title = Util.getTag(
        'h4',
        'col-span-2 md:col-span-3 text-center font-bold text-lg'
      );

      if (i == 0) {
        title.innerText = 'Cantrips';
      } else {
        title.innerText = `Level ${i}`;
      }
      innerframe.append(title);
      spells.forEach((item) => {
        if (item.level == i) {
          let container = Util.getTag(
            'div',
            'flex gap-2 align-center justify-center rounded-md border border-white'
          );
          let align_span = Util.getTag('span', '');
          let check = document.createElement('input');
          check.type = 'checkbox';
          check.value = item.level;
          check.id = item.id; //for validation on submit

          align_span.append(check);
          container.append(align_span);
          container.append(item.name);
          innerframe.append(container);
        }
      });
      list_frame.append(innerframe);
    }

    this.extraSpellsModalListTarget.append(list_frame);
  }

  submitExtraSpellsChoices(event) {
    let chosen = [];
    let frame_i = 0;
    let source_i = 0;
    let children_i = 0;
    let source_children = [];
    let limit = 0;
    this.extraSpellsModalListTarget.childNodes.forEach((frame) => {
      if (frame_i > 0) {
        source_i = 0;
        frame.childNodes.forEach((container) => {
          if (source_i == 1) {
            let choose_text = container.firstChild.innerText;
            let textsplit = choose_text.split(' ');
            limit += parseInt(textsplit[1]);
          }
          if (source_i > 1) {
            source_children = container.children || [];
            for (let item of source_children) {
              if (children_i > 0) {
                if (item.firstChild.firstChild.checked) {
                  chosen.push([
                    item.firstChild.firstChild.id, //db id
                    item.firstChild.firstChild.value, //spell level
                  ]);
                }
              }
              children_i++;
            }
            children_i = 0;
          }
          source_i++;
        });
      }
      frame_i++;
    });

    if (chosen.length <= limit) {
      this.chosenExtras = chosen;
      this.putExtraSpellsToSheet(chosen);
      event.target.parentNode.close();
    }
  }

  putExtraSpellsToSheet(chosen) {
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

    if (this.allSpells) {
      chosen.forEach((taken) => {
        if (!this.chosenClassSpells.includes(taken)) {
          this.allSpellList.forEach((spell) => {
            if (spell.id == taken[0])
              this.putSingleSpellTaken(spell, targets[spell.level]);
          });
        }
      });
    } else {
      chosen.forEach((taken) => {
        if (!this.chosenClassSpells.includes(taken)) {
          this.validatedExtraSpells.forEach((spell) => {
            if (spell.id == taken[0])
              this.putSingleSpellTaken(spell, targets[spell.level]);
          });
        }
      });
    }
  }
  //-----------------Equipment Modal ------------------//

  //working with this section of the class and background 
  /*
  equipment_choices: {
    'choices' => [
      ['Rapier#1','Longsword#1','simple#1'],
      ["Diplomat's Pack#1","Entertainer's Pack#1"],
      ['Lute#1','Bagpipes#1'],
    ],
    'default' => ['Leather Armor#1','Dagger#1'],
  },
  */

  chooseEquipment() {
    //consoel.log('chooseEquipment');
    Util.removeAllChildNodes(this.equipmentClassStartTarget);
    Util.removeAllChildNodes(this.equipmentBGStartTarget);
    let class_choices = false;
    let bg_choices = false;
    if (this.class_equip_choices['choices'].length > 0)
      class_choices = this.class_equip_choices['choices'];

    if (this.bg_equip_choices['choices'].length > 0)
      bg_choices = this.bg_equip_choices['choices'];

    if (class_choices) {
      this.populateEquipmentModal(
        class_choices,
        this.equipmentClassStartTarget,
        'Class'
      );
    } else {
      this.equipmentClassStartTarget.append(
        Util.getTag(
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
        Util.getTag(
          'p',
          'font-semibold p-4',
          'No choices for this background.'
        )
      );
    }
  }

  /* choices looks like this
    [
      ['Rapier#1','Longsword#1','simple#1'],
      ["Diplomat's Pack#1","Entertainer's Pack#1"],
      ['Lute#1','Bagpipes#1'],
    ],
  */
  populateEquipmentModal(choices, target, title) {
    Util.removeAllChildNodes(target);

    choices.forEach((choice) => {
      let number_of_choices = choice.length; //[3,3,2] above
      let container = Util.getTag('div', 'equipment-row');

      choice.forEach((code) => { //'Rapier#1'  or 'Longsword#1'
        if (typeof code == 'string') { //I think this is the only one that will ever fire


          let values = code.split('#');

          let choice_box = Util.getTag('div', 'choice-box');
          container.append(choice_box);

          let choice_labels = Util.getTag(
            'div',
            'flex gap-4 items-center justify-center'
          );
          choice_box.append(choice_labels);


          for (let i = 0; i < parseInt(values[1]); i++) {
            //codes for a select box are all lowercase, but named items are capitalized
            if(values[0].toLowerCase() == values[0]) {
              Util.getSelect(values[0], choice_labels);
            } else {
              choice_labels.append(Util.getTag('p','p-1',values[0]));
            }
          }
          let checkbox = Util.getTag('input', '');
          checkbox.type = 'checkbox';
          choice_box.prepend(checkbox);

          container.append(
            Util.getTag('p', 'text-lg font-black', 'or')
          );
        } else { console.log( 'code not a string' ); }
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
      let check = Util.validateEquipmentRow(row);
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
    Util.removeAllChildNodes(this.atkNamesTarget);
    Util.removeAllChildNodes(this.attackBonusesTarget);
    Util.removeAllChildNodes(this.attackDamagesTarget);

    //reset equipped armor so we can recalculate AC correctly
    this.equipped_armor = [];

    fetch(`/labels/index`)
      .then((response) => response.json())
      .then((data) => {
        this.targetEquipmentNodes(equipment, data);
      });

    fetch(`/labels/weapons`)
      .then((response) => response.json())
      .then((data) => {
        let unique = [...new Set(equipment)];

        for (let item of unique) {
          for (let weapon of data) {
            if (weapon.name == item) {
              this.populateAttack(
                weapon.name,
                weapon.hit_die,
                weapon.dmg_type,
                weapon.properties,
                weapon.wep_type,
                weapon.ranged
              );
            }
          }
        }
      });
  }

  //puts equipment under the correct target and adds armor to this.equipped_armor
  //I calculate AC here because I'm not sure of a better place in the lifecycle for it
  targetEquipmentNodes(equipment, data) {
    equipment.forEach((item) => {
      if (data.weapons.includes(item)) {
        this.equipWeaponsTarget.append(
          Util.getTag('p', 'font-medium', item)
        );
      } else if (data.armor.includes(item)) {
        this.equipArmorTarget.append(
          Util.getTag('p', 'font-medium', item)
        );
        //for AC calculation
        this.equipped_armor.push(item);
      } else if (data.tools.includes(item)) {
        this.equipToolsTarget.append(
          Util.getTag('p', 'font-medium', item)
        );
      } else {
        this.equipEquipmentTarget.append(
          Util.getTag('p', 'font-medium', item)
        );
      }
    });

    if (this.equipped_armor.length > 0) {
      fetch(`/labels/armor`)
        .then((response) => response.json())
        .then((data) => {
          this.updateEquipmentAC(data);
        });
    } else {
      //unarmored defense for barb and monk
      if (this.choices.get('player_class') == 'Barbarian') {
        this.substatACTarget.innerText =
          10 +
          Util.calcMod(this.stats[1]) +
          Util.calcMod(this.stats[2]);
      }
      if (this.choices.get('player_class') == 'Monk') {
        this.substatACTarget.innerText =
          10 +
          Util.calcMod(this.stats[1]) +
          Util.calcMod(this.stats[4]);
      }
    }
  }

  updateEquipmentAC(armor) {
    let armor_class = 0;
    //get rid of duplicates in case they get in there somehow, later seed additions could do it
    this.equipped_armor = [...new Set(this.equipped_armor)];
    for (let item of this.equipped_armor) {
      if (item == 'Shield') {
        armor_class += 2;
      } else {
        for (let piece of armor) {
          //if we get a match, make sure we meet the strength requirement before adding the ac bonus
          if (item == piece.name && piece.str_req <= this.stats[0]) {
            armor_class += piece.base_ac;
            //armor type limits the dexterity bonus available
            switch (piece.arm_type) {
              case 'Light':
                armor_class += Util.calcMod(this.stats[1]);
                break;
              case 'Medium':
                armor_class += Math.min(
                  Util.calcMod(this.stats[1]),
                  2
                );
                break;
              default:
                break;
            }
          }
        }
      }
    }
    this.substatACTarget.innerText = armor_class;
  }

  //puts a single row to the attackList targt for each unique weapon in starting equipment
  populateAttack(
    weapon,
    die,
    dmg_type,
    properties,
    weapon_class,
    ranged
  ) {
    let name = Util.getTag('p', 'sheetcell w-1/4', weapon);
    let damage = Util.getTag(
      'p',
      'sheetcell w-1/4',
      `${die} ${dmg_type}`
    );
    let props = Util.getTag('p', 'sheetcell w-1/3', properties);

    //all this is to figure out the attack bonus for each weapon
    //based on proficiency and the weapon type, finesse is handled by using the highest bonus
    let sourcelist = [
      this.raceWeaponsTarget,
      this.subraceWeaponsTarget,
      this.classWeaponsTarget,
      this.subclassWeaponsTarget,
      this.backgroundWeaponsTarget,
    ];

    let proficiencies = [];
    for (let section of sourcelist) {
      let items = section.children;
      for (let item of items) {
        let checker = item.innerText;
        if (checker.slice(-1) != ':') proficiencies.push(checker);
      }
    }
    let unique = [...new Set(proficiencies)];
    let bonus = 0;

    //add proficiency
    if (
      unique.includes(name) ||
      unique.includes(Util.capitalize(weapon_class))
    )
      bonus += this.prof_mod;

    //then, if finesse we have to choose the highest bonus of dex/str for the weapon
    let str_bonus = Util.calcMod(this.stats[0]);
    let dex_bonus = Util.calcMod(this.stats[1]);

    if (properties.includes('Finesse')) {
      bonus += Math.max(str_bonus, dex_bonus);
    } else {
      //otherwise we depend on the ranged bool to determine which bonus to use
      ranged == 1 ? (bonus += dex_bonus) : (bonus += str_bonus);
    }

    let atk_bonus = Util.getTag('p', 'sheetcell w-1/4', bonus);

    let row = Util.getTag('div', 'flex p-2 w-full');
    row.append(name);
    row.append(atk_bonus);
    row.append(damage);
    row.append(props);
    this.attackListTarget.append(row);
  }

  //used for dragonborne breath weapons
  populateModAttack(weapon, die, dmg_type, properties, bonus) {
    let name = Util.getTag('p', 'sheetcell w-1/4', weapon);
    let damage = Util.getTag(
      'p',
      'sheetcell w-1/4',
      `${die} ${dmg_type}`
    );
    let props = Util.getTag('p', 'sheetcell w-1/3', properties);

    let atk_bonus = Util.getTag('p', 'sheetcell w-1/4', bonus);

    let row = Util.getTag('div', 'flex p-2 w-full');
    row.append(name);
    row.append(atk_bonus);
    row.append(damage);
    row.append(props);
    this.attackListTarget.append(row);
  }

  //----------------------------- Modal Activation ---------------------------------//
  showLangDialog() {
    this.dialogLanguagesTarget.showModal();
  }
  showClassSkillsDialog() {
    this.dialogClassSkillsTarget.showModal();
  }
  showClassFeaturesDialog() {
    this.dialogClassFeaturesTarget.showModal();
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
    this.dialogTraitsTarget.showModal();
  }
  showEquipmentDialog() {
    this.dialogEquipmentTarget.showModal();
  }
  showASIDialog() {
    this.dialogASITarget.showModal();
  }
  showExtraSpellsDialog() {
    this.dialogExtraSpellsTarget.showModal();
  }

  //----------------------------- Base Stat Methods ---------------------------------//
  statModUpdate() {
    //consoel.log('statModUpdate');
    let statmod_targets = [
      this.strModTarget,
      this.dexModTarget,
      this.conModTarget,
      this.intModTarget,
      this.wisModTarget,
      this.chaModTarget,
    ];
    let index = 0;
    for (let target of statmod_targets) {
      target.innerText = Util.modWithSign(
        Util.calcMod(this.stats[index])
      );
      index++;
    }
  }

  randomStats() {
    for (let i = 0; i < 6; i++) {
      let rand = Math.floor(Math.random() * 20) + 1;
      this.base_stats[i] = rand;
      this.stats[i] = this.base_stats[i];
    }

    if (this.raceASI != 0 && this.subraceASI != 0)
      Util.calculateStats(
        this.stats,
        this.base_stats,
        this.raceASI,
        this.subraceASI
      );

    Util.updateStats(this.stat_targets, this.stats);
    this.catUpdate({}, 'stats');
  }
}
