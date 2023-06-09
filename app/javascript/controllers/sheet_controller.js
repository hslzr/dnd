import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'charLevel',
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
    let languages, skills, weps, arm, tools, features;

    //Handle category specific behaviors here
    switch (cat_type) {
      case 'race':
        console.log('Detected Race'); //debugging
        languages = this.raceLanguagesTarget;
        skills = this.raceSkillsTarget;
        weps = this.raceWeaponsTarget;
        arm = this.raceArmorTarget;
        tools = this.raceToolsTarget;
        features = this.raceFeaturesTarget;

        //setters
        this.aboutRaceTarget.innerText = data.name;
        this.substatSpeedTarget.innerText = data.speed;
        this.putList(data, data.racial_traits, features);
        break;

      case 'subrace':
        console.log('Detected Subrace'); //debugging
        languages = this.subraceLanguagesTarget;
        skills = this.subraceSkillsTarget;
        weps = this.subraceWeaponsTarget;
        arm = this.subraceArmorTarget;
        tools = this.subraceToolsTarget;
        features = this.subraceFeaturesTarget;

        //setters
        this.aboutSubraceTarget.innerText = data.name;
        this.putList(data, data.racial_traits, features);
        break;

      case 'player_class':
        console.log('Detected Class'); //debugging
        languages = this.classLanguagesTarget;
        skills = this.classSkillsTarget;
        weps = this.classWeaponsTarget;
        arm = this.classArmorTarget;
        tools = this.classToolsTarget;
        //features aren't an array so PutList breaks because it calls forEach on it
        //skills are a choice for class

        //setters
        this.aboutClassTarget.innerText = data.name;
        break;

      case 'subclass':
        console.log('Detected Subclass'); //debugging
        break;

      case 'background':
        console.log('Detected Background'); //debugging
        break;

      default:
        console.log('Default Case'); //debugging
        break;
    }

    //not all categories have these so I'm defaulting to empty array
    //which will make putList fizzle out and do nothing
    let data_lang = data.languages || [];
    let data_skills = data.skills || [];
    let data_weps = data.weapons || [];
    let data_arm = data.armor || [];
    let data_tools = data.tools || [];

    //we output the needed <p></p> tags to the target defined in the case above
    //we pass in a category instance, collection within it, and output target
    //if the collection is empty, the function returns without side-effects
    console.log('0');
    this.putList(data, data_lang, languages);
    console.log('1');
    this.putList(data, data_weps, weps);
    console.log('2');
    this.putList(data, data_arm, arm);
    console.log('3');
    this.putList(data, data_tools, tools);
    console.log('4');

    if (cat_type != 'player_class') {
      this.putList(data, data.skills, skills);
    }
  }

  //Utility Methods//

  //creates p tags for collection and appends list to target with label for category name
  //clears allChildfren of Target before appending so I use it in specific labeled targets only
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
}
