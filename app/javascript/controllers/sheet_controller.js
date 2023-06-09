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
    'raceLanguages',
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
    //we'll call this whenever there's a change in the top form
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
      //racelist.item(i).innerText
    }
  }

  raceUpdate(race) {
    this.aboutRaceTarget.innerText = race.name;

    //Racial Languages
    //clear previous choices
    this.removeAllChildNodes(this.raceLanguagesTarget);
    //race label
    let race_tag = document.createElement('p');
    race_tag.append(`${race.name}:`);
    this.raceLanguagesTarget.append(race_tag);
    //fill list
    race.languages.forEach((language) => {
      let l_item = document.createElement('p');
      l_item.classList.add('font-semibold');
      l_item.append(language);
      this.raceLanguagesTarget.append(l_item);
    });

    //Racial Features
    //clear previous choices
    this.removeAllChildNodes(this.raceFeaturesTarget);
    //race label
    this.raceFeaturesTarget.append(race_tag);
    //fill list
    race.racial_traits.forEach((feature) => {
      let l_item = document.createElement('p');
      l_item.classList.add('font-semibold');
      l_item.append(feature);
      this.raceFeaturesTarget.append(l_item);
    });
  }

  //DOM Utility functions
  removeAllChildNodes(parent) {
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }
}
