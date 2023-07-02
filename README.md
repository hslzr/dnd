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


##  Bard
   choose three instruments as tools
   equipment_choices -> choose any musical instrument
   Bard College, modal validation, noted above
      

# heroku
https://uglysheetmaker-e6deabaebc10.herokuapp.com/