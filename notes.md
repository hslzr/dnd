
# main tasks

backgrounds and feats in seed

Different methods of stat assignment

Implement Feats

Deactivate buttons that lead to empty modals (Tools done)


# Rogue
    filled but expertise not implemented, especially for thief's tools
# Sorceror
  Draconic Resilience needs customMods
# Warlock
    -lots of work

# Spells
   attack spells dont populate attacks
    sheet#populateSpellAttack is written to accept a spell object from the db

# Limits
  'specialties' implemented as a customMod, but more than one would break the system, 
    i can fix this with the id strategy used in customMod for gated_collections

# Bugs

    extra spells double population if submit twice


# Refactors 

    putExtraSpellsToSheet

    spellsModal looks worse than ExtraSpellsModal though that needs some style work as well


# handoff notes

    have to implement some warlock features, then add the subclasses

    after Warlock I feel like a big refactor is needed,
        -firstly get it working as best as I can, functional beta in production is the priority
        -clean unused db entries like primary_skills
        -determine what db columns should just be customMods or vice versa
        -organize by concern
        -document the data being passed into each function and the side effects
        -break out modules for everything but the control loop so I can isolate that