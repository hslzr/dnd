# README

* Ruby 3.1.2

* PostgreSQL 1.1

* Tailwind CSS

The seed file is one big copyright violation, this is a student project and not for profit, sale or public use. If you only used homebrew in a new seed file you might land in a grey area.

# main tasks

Fill out the seed with remaining classes, subclasses, backgrounds, and feats

Different methods of stat assignment

Implement Feats

Deactivate buttons that lead to empty modals

# Barbarian
  done
# Bard
  done
# Cleric
  done
# Druid
 used subclasses for different Land Circles

# Fighter
  fill subclasses 

# Monk
  ki points not handled at all yet
  fill subclasses

# Ranger
  done
  fill subclasses

# Spells
   done

# Limits
  'specialties' implemented as a customMod, but more than one would break the system, 
    I have to limit use to subclasses for now since Fighter#BattleMaster was the first use
    i could generate new <dialog> elements or pages in the existing one for each instance 
    in a categoryMap like this.specialties if I make one

# bugs
  attack spells dont populate attacks
    sheet#populateSpellAttack is written to accept a spell object from the db

  racial tools modal has an empty select input
  equipment modal population
    -no checkboxes on some entries
    =some entries missing, shows 'entry or'

# heroku
https://uglysheetmaker-e6deabaebc10.herokuapp.com/