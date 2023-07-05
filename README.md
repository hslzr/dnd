# README

* Ruby 3.1.2

* PostgreSQL 1.1

* Tailwind CSS

The seed file is one big copyright violation, this is a student project and not for profit, sale or public use. If you only used homebrew in a new seed file you might land in a grey area.

# main tasks
Fill out the seed with remaining classes, subclasses, backgrounds, and feats
  I'm adding capabilities to customModifiers() as needed, working my way through the classes and starting on Cleric subclasses right now

  Theres a problem with the way extra proficiencies are handled, all proficiency choices should be in the same place and use select inputs populated with the allowed values.
  I have to rewrite the population, validation, and submission on the category proficiencies and customMod proficiencies.

  If i don't do this it won't work as is, there would be huge pages of options to check in the modal.

Implement specific_spells:
  I'm putting this off until i've filled out the spells catalog, otherwise I'll pull a bunch of db dead-ends

Different methods of stat assignment

Implement Feats - these can use customMOd for most things I think

#  Bard
   choose three instruments as tools
   equipment_choices -> choose any musical instrument

# Cleric
  extra proficiencies from Blessings of Knowledge
  double check if I implemented Expertise yet somewhere in the modifier calculation
  remaining subclasses
  -1 spells known, prepared spells should be used instead of spells known limit

# Druid
  specific_spells_choices handling in customModifiers() for circle of the land subclass
  -1 spells known, prepared spells should be used instead of spells known limit
# heroku
https://uglysheetmaker-e6deabaebc10.herokuapp.com/