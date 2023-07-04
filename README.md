# README

* Ruby 3.1.2

* PostgreSQL 1.1

* Tailwind CSS

The seed file is one big copyright violation, this is a student project and not for profit, sale or public use. If you only used homebrew in a new seed file you might land in a grey area.

# main tasks
Implement customModifiers (db adjustment)
Fill out the seed with remaining classes, subclasses, backgrounds, and feats
Implement Feats
Different methods of stat assignment

# Functions needed
I'm working on the seed and classes/subraces are adding these things I can't handle yet
   - speed modifier
   - Draconic ancestries should be level one class custom features
    have to add the breath weapon as an attack with the correct type
   - Extra skills and stat points in Half-Elf need handling
   - inconsistent number on spellcasting_ability in player_class model, doesn't count from 0
   -some classes have a choice at 3rd level that decides bonuses at later levels, i don't want to change the database but we might need a variable to determine how to handle validation in the modal

# secondary spell lists
  Working

##  Bard
   choose three instruments as tools
   equipment_choices -> choose any musical instrument
   Bard College, affected by modal validation issue noted above


# heroku
https://uglysheetmaker-e6deabaebc10.herokuapp.com/