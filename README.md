# README

* Ruby 3.1.2

* PostgreSQL 1.1

* Tailwind CSS

The seed file is one big copyright violation, this is not for profit or public use.

# main tasks
Fill out the seed with remaining classes, subclasses, backgrounds, and feats
Implement Feats
Different methods of stat assignment

# Functions needed
I'm working on the seed and classes/subraces are adding these things I can't handle yet
   - speed modifier
   - Cantrip or spells added,
      specifically or chosen from a spell list,
      with a specific spellcasting stat
   - Extra languages on subrace not working properly I think
   - Are draconic ancestries subraces? may as well be,
    have to add the breath weapon as an attack with the correct type
   - Extra skills and stat points in Half-Elf need handling
   - inconsistent number on spellcasting_ability in player_class model, doesn't count from 0
   -some classes have a choice at 3rd level that decides bonuses at later levels, i don't want to change the database but we might need a variable to determine how to handle validation in the modal

# secondary spell lists
  You'll only have a few spells like this,so a smaller display frame will work, we can populate them to the sheet on submission of the modal and include the relevant stats and things inside that frame, leaving the rest of the sheet alone. These are spells with special rules, but we'll put them in the normal spell list, just with a different background color.

  the database model for each background will need an extra_spell_lists Map object
  extra_spell_lists = {
      spelllist name => {
        cantrips choices,[x,y,z...] //value for each character level
        spells choics,[xyz]
        spells_or_cantrips choices,[xyz]
        spellcasting ability, // accomodate a 'own' keyword for the character's casting ability
        spells_are_extra, wether to count these spells in Spells Known
      },
      othr_spelllist_name => {...ss},
      ...
  }

##  Bard
   choose three instruments as tools
   equipment_choices -> choose any musical instrument
   Bard College, modal validation, noted above


# heroku
https://uglysheetmaker-e6deabaebc10.herokuapp.com/