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
    //iterator replaes forEach on Map objects
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
    console.log(this.choices);
  }

  raceHandler(event) {
    let racelist = event.target.children;
    for (let i = 0; i < racelist.length; i++) {
      if (racelist.item(i).selected) {
        fetch('/races/index')
          .then((response) => response.json())
          .then((data) => (this.allRaces = data));

        console.log(this.allRaces);
        //console.log(racelist.item(i).innerText);
      }
    }
  }
}
