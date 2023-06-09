import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'charName',
    'profBonus',
    'passPerception',
    'strBase',
    'strSavingThrowMod',
    'athleticsMod',
    'dexBase',
    'dexSavingThrowMod',
    'acrobaticsMod',
    'sleightOfHandMod',
    'stealthMod',
    'conBase',
    'conSavingThrowMod',
    'intBase',
    'intSavingThrowMod',
    'arcanaMod',
    'historyMod',
    'investigationMod',
    'natureMod',
    'religionMod',
    'wisBase',
    'wisSavingThrowMod',
    'animalHandlingMod',
    'insightMod',
    'medicineMod',
    'perceptionMod',
    'survivalMod',
    'chaBase',
    'chaSavingThrowMod',
    'deceptionMod',
    'intimidationMod',
    'performanceMod',
    'persuasionMod',
    'aboutClass',
    'aboutLevel',
    'aboutBackground',
    'aboutPName',
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
  ];

  connect() {
    //we'll take over from the turbo frame and store the form data in a Map
    this.choices = new Map();
    this.choices.set('race', 'none');
    this.choices.set('subrace', 'none');
    this.choices.set('player_class', 'none');
    this.choices.set('subclass', 'none');
    this.choices.set('background', 'none');
  }

  update() {
    //we'll call this whenever there's a change in the top form to update the state object this.choices
    //iterator replaces forEach on Map objects
    let iterchoice = this.choices.entries();

    //there are 5 choices to make
    for (let i = 0; i < 5; i++) {
      //we get the options for each form select in an HTMLCollection
      let label = iterchoice.next().value[0];
      let options = document.getElementById(label).children;

      //we have to use set and item to deal with the HTMLCollection
      for (let j = 0; j < options.length; j++) {
        if (options.item(j).selected)
          this.choices.set(label, options.item(j).innerText);
      }
    }
  }

  //called on change in Race dropdown
  raceHandler(event) {
    let racelist = event.target.children; //the target is the dropdown div containing options
    for (let i = 0; i < racelist.length; i++) {
      //racelist is an HTMLCollection
      if (racelist.item(i).selected) {
        name = racelist.item(i).innerText;
        fetch(`/races/${name}`)
          .then((response) => response.json())
          .then((data) => this.raceUpdate(data));
      }
    }
  }

  //called by async function in raceHandler()
  //unhandled: tool choices, extra languages
  raceUpdate(race) {
    this.aboutRaceTarget.innerText = race.name;

    this.substatSpeedTarget.innerText = race.speed;

    //Racial Languages
    this.putList(race, race.languages, this.raceLanguagesTarget);

    //Racial Features
    this.putList(race, race.racial_traits, this.raceFeaturesTarget);

    //Racial Skills
    this.putList(race, race.skills, this.raceSkillsTarget);

    //Racial Weapons
    this.putList(race, race.weapons, this.raceWeaponsTarget);

    //Racial Armor
    this.putList(race, race.armor, this.raceArmorTarget);

    //Racial Tools
    this.putList(race, race.tools, this.raceToolsTarget);
  }

  subraceHandler(event) {
    let subracelist = event.target.children; //the target is the dropdown div containing options
    for (let i = 0; i < subracelist.length; i++) {
      //racelist is an HTMLCollection
      if (subracelist.item(i).selected) {
        name = subracelist.item(i).innerText;
        fetch(`/subraces/${name}`)
          .then((response) => response.json())
          .then((data) => this.subraceUpdate(data));
      }
    }
  }

  categoryHandler(event) {
    let labels = event.params;
    let list = event.target.children;

    for (let i = 0; i < list.length; i++) {
      //list is an HTMLCollection
      if (list.item(i).selected) {
        let name = list.item(i).innerText;
        fetch(`${labels.url}${name}`)
          .then((response) => response.json())
          .then((data) => this.catUpdate(data, event.target.id));
      }
    }
  }

  catUpdate(data, cat_type) {
    let languages, skills, weps, arm, tools;
    switch (cat_type) {
      case 'race':
        console.log('Detected Race');
        break;
      case 'subrace':
        console.log('Detected Subrace');
        break;
      case 'player_class':
        console.log('Detected Class');
        languages = this.classLanguagesTarget;
        skills = this.classSkillsTarget;
        weps = this.classWeaponsTarget;
        arm = this.classArmorTarget;
        tools = this.classToolsTarget;
        //features aren't an array so PutList breaks because it calls forEach on it
        //skills are a choice for class
        break;
      case 'subclass':
        console.log('Detected Subclass');
        break;
      case 'background':
        console.log('Detected Background');
        break;
      default:
        console.log('Default Case');
        break;
    }
    console.log('language');
    if (cat_type != 'player_class') {
      //no languages in class, skipping skills due to choice available
      this.putList(data, data.languages, languages);

      console.log('skills');
      this.putList(data, data.skills, skills);
    }
    console.log('weps');
    this.putList(data, data.weapons, weps);

    console.log('armor');
    this.putList(data, data.armor, arm);

    console.log('tools');
    this.putList(data, data.tools, tools);

    console.log('done');
  }

  subraceUpdate(subrace) {
    this.aboutSubraceTarget.innerText = subrace.name;

    //Subrace Languages
    this.putList(
      subrace,
      subrace.languages,
      this.subraceLanguagesTarget
    );

    //Subrace Features
    this.putList(
      subrace,
      subrace.racial_traits,
      this.subraceFeaturesTarget
    );

    //Subrace Skills
    this.putList(subrace, subrace.skills, this.subraceSkillsTarget);

    //Subrace Weapons
    this.putList(subrace, subrace.weapons, this.subraceWeaponsTarget);

    //Subrace Armor
    this.putList(subrace, subrace.armor, this.subraceArmorTarget);

    //Subrace Tools
    this.putList(subrace, subrace.tools, this.subraceToolsTarget);
  }

  //Utility Methods//

  //creates p tags for collection and appends list to target with label for category name
  //clears allChildfren of Target before appending so I use it in specific labeled targets only
  putList(category, collection, target) {
    this.removeAllChildNodes(target);

    //after removal of nodes so switching to something without a collection is OK
    if (collection.length == 0) return;

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

  getPTag(string) {
    let out = document.createElement('p');
    out.classList.add('font-medium');
    out.append(string + ':');
    return out;
  }
}
