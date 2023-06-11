import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
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
    'backgroundFeatures',
    'raceSkills',
    'subraceSkills',
    'classSkills',
    'subclassSkills',
    'backgroundSkills',
    'raceLanguages',
    'subraceLanguages',
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
    'castingClass',
    'castingAbility',
    'castingSaveDC',
    'castingAttackBonus',
    'equipGP',
    'equipSP',
    'equipCP',
    'equipArmor',
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
    this.str;
    this.dex;
    this.con;
    this.int;
    this.wis;
    this.cha;
    ///set on statModUpdate
    this.stats;
  }

  updateChoices() {
    //console.log('updateChoices');
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

    //console.log(this.choices);
  }

  categoryHandler(event) {
    //console.log('categoryHandler');
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
    //console.log('catUpdate');
    //event.target.id is actually the :name param
    let languages, skills, weps, arm, tools, features;

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
        break;

      case 'player_class':
        languages = this.classLanguagesTarget;
        skills = this.classSkillsTarget;
        weps = this.classWeaponsTarget;
        arm = this.classArmorTarget;
        tools = this.classToolsTarget;
        features = this.classFeaturesTarget;
        //features aren't an array so PutList breaks because it calls forEach on it
        //skills are a choice for class

        //setters
        this.aboutClassTarget.innerText = data.name;
        this.sheet_class = data.name;
        this.hit_die = data.hit_die;
        this.saving_throws = data.saving_throws;

        //the seed stores saving throw proficiencies as indexes to this array
        let primary_proficiencies = [
          this.strSaveProfTarget,
          this.dexSaveProfTarget,
          this.conSaveProfTarget,
          this.intSaveProfTarget,
          this.wisSaveProfTarget,
          this.chaSaveProfTarget,
        ];

        for (let i = 0; i < this.saving_throws.length; i++) {
          let item = this.saving_throws[i];
          primary_proficiencies[item].innerText = '+';
        }

        data.spellcasting_ability
          ? (this.castingAbilityTarget.innerText =
              data.spellcasting_ability)
          : (this.castingAbilityTarget.innerText = 'none');

        let spell_mod;
        switch (data.spellcasting_ability) {
          case 'STR':
            spell_mod = this.calcMod(this.str);
            break;
          case 'DEX':
            spell_mod = this.calcMod(this.dex);
            break;
          case 'CON':
            spell_mod = this.calcMod(this.con);
            break;
          case 'INT':
            spell_mod = this.calcMod(this.int);
            break;
          case 'WIS':
            spell_mod = this.calcMod(this.wis);
            break;
          case 'CHA':
            spell_mod = this.calcMod(this.cha);
            break;
          default:
            spell_mod = 0;
            break;
        }
        if (spell_mod != 0) {
          let bonus = spell_mod + this.proficiencyModifier();
          this.castingSaveDCTarget.innerText = bonus + 8;
          this.castingAttackBonusTarget.innerText = bonus;
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
        break;

      case 'background':
        languages = this.backgroundLanguagesTarget;
        skills = this.backgroundSkillsTarget;
        weps = this.backgroundWeaponsTarget;
        arm = this.backgroundArmorTarget;
        tools = this.backgroundToolsTarget;
        features = this.backgroundFeaturesTarget;

        //setters
        this.aboutBackgroundTarget.innerText = data.name;
        this.sheet_background = data.name;
        break;

      case 'level':
        this.level = event.target.value;

        this.profBonusTarget.innerText =
          Math.ceil(this.level / 4) + 1;

        this.aboutLevelTarget.innerText = this.level;

        //conditionals for form asset assignment, order is probably important and this is prob wrong
        if (this.str) {
        }
        if (this.sheet_race) {
        }
        if (this.sheet_subrace) {
        }
        if (this.sheet_class) {
        }
        if (this.sheet_subclass) {
        }
        if (this.sheet_background) {
        }
        break;

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
    //once the changed category has been updated on the sheet, we want to finish up if possible
    //this runs if choices is entirely filled out
    if (this.isChoicesFull() && this.str) {
      console.log('Choices is full');

      //this.populateProficiencies(); //tbw
      this.populateSkillModifiers(); //wip

      this.substatInitiativeTarget.innerText =
        this.dexModTarget.innerText;

      if (!this.equipArmorTarget.hasChildNodes()) {
        this.substatACTarget.innerText = 10 + this.calcMod(this.dex);
      } else {
        console.log('armor equipped');
      }

      this.trackingHitDiceTarget.innerText = `${this.level}d${this.hit_die}`;

      //at end of base calculations we should apply custom methods brought in by categories
      //e.g. the Barbarian Unarmored Defense
      this.customModifiers();
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
    //console.log('populateCatAbilities');
    //not all categories have these so I'm defaulting to empty array
    //which will make putList fizzle out and do nothing
    let data_lang = data.languages || [];
    let data_skills = data.skills || [];
    let data_weps = data.weapons || [];
    let data_arm = data.armor || [];
    let data_tools = data.tools || [];
    let data_features = data.features || [];

    //we output the needed <p></p> tags to the target defined in the case above
    this.putList(data, data_lang, languages);
    this.putList(data, data_weps, weps);
    this.putList(data, data_arm, arm);
    this.putList(data, data_tools, tools);

    if (cat_type != 'player_class') {
      //these are choices for a class
      this.putList(data, data_skills, skills);
      if (cat_type != 'subclass')
        this.putList(data, data_features, features);
    }
  }

  populateSkillModifiers() {
    //the class saving throws are stored as indexes to the bonus array so we go through
    //all this to assign 6 values possible bonuses from a db model then output to 6 different targets
    let save_modifiers = [
      this.strSavingThrowModTarget,
      this.dexSavingThrowModTarget,
      this.conSavingThrowModTarget,
      this.intSavingThrowModTarget,
      this.wisSavingThrowModTarget,
      this.chaSavingThrowModTarget,
    ];
    let prof_mod = this.proficiencyModifier();

    let bonuses = [0, 0, 0, 0, 0, 0];
    this.saving_throws.forEach((item) => {
      bonuses[item] += prof_mod;
    });
    for (let i = 0; i < 6; i++) {
      save_modifiers[i].innerText =
        bonuses[i] + this.calcMod(this.stats[i]);
    }

    //skill modifiers are easier if we have the ProfTargets filled when this is called
    this.updateSkill(
      this.str,
      this.athleticsProfTarget,
      this.athleticsModTarget,
      prof_mod
    );
    this.updateSkill(
      this.dex,
      this.acrobaticsProfTarget,
      this.acrobaticsModTarget,
      prof_mod
    );
    this.updateSkill(
      this.dex,
      this.sleightOfHandProfTarget,
      this.sleightOfHandModTarget,
      prof_mod
    );
    this.updateSkill(
      this.dex,
      this.stealthProfTarget,
      this.stealthModTarget,
      prof_mod
    );
    this.updateSkill(
      this.int,
      this.arcanaProfTarget,
      this.arcanaModTarget,
      prof_mod
    );
    this.updateSkill(
      this.int,
      this.historyProfTarget,
      this.historyModTarget,
      prof_mod
    );
    this.updateSkill(
      this.int,
      this.investigationProfTarget,
      this.investigationModTarget,
      prof_mod
    );
    this.updateSkill(
      this.int,
      this.natureProfTarget,
      this.natureModTarget,
      prof_mod
    );
    this.updateSkill(
      this.int,
      this.religionProfTarget,
      this.religionModTarget,
      prof_mod
    );
    this.updateSkill(
      this.wis,
      this.animalHandlingProfTarget,
      this.animalHandlingModTarget,
      prof_mod
    );
    this.updateSkill(
      this.wis,
      this.insightProfTarget,
      this.insightModTarget,
      prof_mod
    );
    this.updateSkill(
      this.wis,
      this.medicineProfTarget,
      this.medicineModTarget,
      prof_mod
    );
    this.updateSkill(
      this.wis,
      this.perceptionProfTarget,
      this.perceptionModTarget,
      prof_mod
    );
    this.updateSkill(
      this.wis,
      this.survivalProfTarget,
      this.survivalModTarget,
      prof_mod
    );
    this.updateSkill(
      this.cha,
      this.deceptionProfTarget,
      this.deceptionModTarget,
      prof_mod
    );
    this.updateSkill(
      this.cha,
      this.intimidationProfTarget,
      this.intimidationModTarget,
      prof_mod
    );
    this.updateSkill(
      this.cha,
      this.performanceProfTarget,
      this.performanceModTarget,
      prof_mod
    );
    this.updateSkill(
      this.cha,
      this.persuasionProfTarget,
      this.persuasionModTarget,
      prof_mod
    );
  }

  updateSkill(base_stat, profTarget, modTarget, prof_mod) {
    let bonus = this.calcMod(base_stat);
    if (profTarget.innerText == '+') bonus += prof_mod;
    if (profTarget.innerText == 'E') bonus += prof_mod * 2;
    modTarget.innerText = bonus;
  }

  skillModifiers() {}

  customModifiers() {}

  //called on all Statbuttons
  statModUpdate() {
    this.strModTarget.innerText = this.modWithSign(
      this.calcMod(this.str)
    );
    this.dexModTarget.innerText = this.modWithSign(
      this.calcMod(this.dex)
    );
    this.conModTarget.innerText = this.modWithSign(
      this.calcMod(this.con)
    );
    this.intModTarget.innerText = this.modWithSign(
      this.calcMod(this.int)
    );
    this.wisModTarget.innerText = this.modWithSign(
      this.calcMod(this.wis)
    );
    this.chaModTarget.innerText = this.modWithSign(
      this.calcMod(this.cha)
    );

    this.stats = [
      this.str,
      this.dex,
      this.con,
      this.int,
      this.wis,
      this.cha,
    ];
  }

  modWithSign(val) {
    let sign;
    if (val == 0) return '0';
    if (val < 0) return `${val}`;
    return `+${val}`;
  }

  //Statbuttons
  randomStats() {
    this.str = Math.floor(Math.random() * 20) + 1;
    this.strBaseTarget.innerText = this.str;
    this.con = Math.floor(Math.random() * 20) + 1;
    this.conBaseTarget.innerText = this.con;
    this.dex = Math.floor(Math.random() * 20) + 1;
    this.dexBaseTarget.innerText = this.dex;
    this.int = Math.floor(Math.random() * 20) + 1;
    this.intBaseTarget.innerText = this.int;
    this.cha = Math.floor(Math.random() * 20) + 1;
    this.chaBaseTarget.innerText = this.cha;
    this.wis = Math.floor(Math.random() * 20) + 1;
    this.wisBaseTarget.innerText = this.wis;

    this.statModUpdate();
  }

  //Utility Methods//

  putList(category, collection, target) {
    //creates p tags for collection and appends list to target with label for category name
    //clears allChildfren of Target before appending so I use it in specific labele
    //we pass in a category instance, collection within it, and output target
    //if the collection is empty, the function returns without side-effects

    if (collection.length == 0) return;

    this.removeAllChildNodes(target);

    target.append(this.getPTag(category.name));
    collection.forEach((item) => {
      let l_item = document.createElement('p');
      l_item.append(item);
      target.append(l_item);
    });
  }

  removeAllChildNodes(parent) {
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }

  //got some styling hiding out in here with the the font-medium
  getPTag(string) {
    let out = document.createElement('p');
    out.classList.add('font-medium');
    out.append(string + ':');
    return out;
  }

  //calculate modifier and return a string '+3' or '-1'
  calcMod(base) {
    return Math.floor(base / 2) - 5;
  }

  proficiencyModifier() {
    return Math.ceil(this.level / 4) + 1;
  }

  isChoicesFull() {
    //console.log('isChoicesFull');

    let checklist = this.choices?.values();
    for (let i = 0; i < this.choices.size; i++) {
      let val = checklist.next().value;
      if (val == 'none' || val == 0) {
        return false;
      }
    }
    return true;
  }

  logChoices() {
    //console.log('logChoices');
    let iter = this.choices.entries();
    for (let i = 0; i < this.choices.size; i++) {
      console.log(iter.next().value);
    }
  }
}
