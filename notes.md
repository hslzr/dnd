
# main tasks

backgrounds and feats in seed

Different methods of stat assignment

Implement Feats

Deactivate buttons that lead to empty modals (Tools done)


# Rogue
    filled but expertise not implemented
# Sorceror
  Draconic Resilience needs customMods
# Warlock
    support proficiencies in eldritch invocations under gated_collections
    -blocked out expanded spell list and it might work, controller takes a big param havent tested that

# EquipmentGearpacks
    in the seed but not implemented
    weight also not calculated for inventory yet

# Spells
   attack spells dont populate attacks
    sheet#populateSpellAttack is written to accept a spell object from the db

# Limits
  'specialties' implemented as a customMod, but more than one would break the system, 
    i can fix this with the id strategy used in customMod for gated_collections - Beguiling Influence

# Bugs

# Refactors 

    putExtraSpellsToSheet
    spellsModal looks worse than ExtraSpellsModal though that needs some style work as well