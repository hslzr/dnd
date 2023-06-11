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
    'athleticsMod',
    'dexBase',
    'dexMod',
    'dexSavingThrowMod',
    'acrobaticsMod',
    'sleightOfHandMod',
    'stealthMod',
    'conBase',
    'conMod',
    'conSavingThrowMod',
    'intBase',
    'intMod',
    'intSavingThrowMod',
    'arcanaMod',
    'historyMod',
    'investigationMod',
    'natureMod',
    'religionMod',
    'wisBase',
    'wisMod',
    'wisSavingThrowMod',
    'animalHandlingMod',
    'insightMod',
    'medicineMod',
    'perceptionMod',
    'survivalMod',
    'chaBase',
    'chaMod',
    'chaSavingThrowMod',
    'deceptionMod',
    'intimidationMod',
    'performanceMod',
    'persuasionMod',
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
  }

  updateChoices() {
    console.log('updateChoices');
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
    console.log('categoryHandler');
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
    console.log('catUpdate');
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

        if (data.spellcasting_ability) {
          this.castingAbilityTarget.innerText =
            data.spellcasting_ability;
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
        console.log('Detected Level');
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
        console.log('Default Case'); //debugging
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
    if (this.isChoicesFull()) {
      console.log('Choices is full');
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
    console.log('populateCatAbilities');
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

  //called on all Statbuttons
  statModUpdate() {
    this.strModTarget.innerText = this.calcMod(this.str);
    this.dexModTarget.innerText = this.calcMod(this.dex);
    this.conModTarget.innerText = this.calcMod(this.con);
    this.intModTarget.innerText = this.calcMod(this.int);
    this.wisModTarget.innerText = this.calcMod(this.wis);
    this.chaModTarget.innerText = this.calcMod(this.cha);
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

  //creates p tags for collection and appends list to target with label for category name
  //clears allChildfren of Target before appending so I use it in specific labele
  //we pass in a category instance, collection within it, and output target
  //if the collection is empty, the function returns without side-effects
  putList(category, collection, target) {
    if (collection.length == 0) return;

    this.removeAllChildNodes(target);

    target.append(this.getPTag(category.name));
    collection.forEach((item) => {
      let l_item = document.createElement('p');
      l_item.append(item);
      target.append(l_item);
    });
  }

  //DOM Utility functions
  removeAllChildNodes(parent) {
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }

  //got some styling hiding out in here withe the font-medium
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

  isChoicesFull() {
    console.log('isChoicesFull');
    this.logChoices();

    let checklist = this.choices?.values();
    for (let i = 0; i < this.choices.size; i++) {
      let val = checklist.next().value;
      if (val == 'none' || val == 0) {
        console.log(val);
        return false;
      }
    }
    return true;
  }

  logChoices() {
    console.log('logChoices');
    let iter = this.choices.entries();
    for (let i = 0; i < this.choices.size; i++) {
      console.log(iter.next().value);
    }
  }
}
