require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "should create character" do
    visit characters_url
    click_on "New character"

    fill_in "Age", with: @character.age
    fill_in "Armor prof", with: @character.armor_prof
    fill_in "Background", with: @character.background_id
    fill_in "Bkgd specialty", with: @character.bkgd_specialty
    fill_in "Bond", with: @character.bond
    fill_in "Char name", with: @character.char_name
    fill_in "Copper", with: @character.copper
    fill_in "Description", with: @character.description
    fill_in "Equipment", with: @character.equipment
    fill_in "Expertise", with: @character.expertise
    fill_in "Eyes", with: @character.eyes
    fill_in "Feat", with: @character.feat_id
    fill_in "Flaw", with: @character.flaw
    fill_in "Gender", with: @character.gender
    fill_in "Gold", with: @character.gold
    fill_in "Hair", with: @character.hair
    fill_in "Height", with: @character.height
    fill_in "Hp max", with: @character.hp_max
    fill_in "Ideal", with: @character.ideal
    fill_in "Languages", with: @character.languages
    fill_in "Player class", with: @character.player_class_id
    fill_in "Player name", with: @character.player_name
    fill_in "Race", with: @character.race_id
    fill_in "Silver", with: @character.silver
    fill_in "Size", with: @character.size
    fill_in "Skill prof", with: @character.skill_prof
    fill_in "Skin", with: @character.skin
    fill_in "Speed", with: @character.speed
    fill_in "Spell slots", with: @character.spell_slots
    fill_in "Spells", with: @character.spells
    fill_in "Tool prof", with: @character.tool_prof
    fill_in "Trait", with: @character.trait
    fill_in "User", with: @character.user_id
    fill_in "Weapon prof", with: @character.weapon_prof
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "should update Character" do
    visit character_url(@character)
    click_on "Edit this character", match: :first

    fill_in "Age", with: @character.age
    fill_in "Armor prof", with: @character.armor_prof
    fill_in "Background", with: @character.background_id
    fill_in "Bkgd specialty", with: @character.bkgd_specialty
    fill_in "Bond", with: @character.bond
    fill_in "Char name", with: @character.char_name
    fill_in "Copper", with: @character.copper
    fill_in "Description", with: @character.description
    fill_in "Equipment", with: @character.equipment
    fill_in "Expertise", with: @character.expertise
    fill_in "Eyes", with: @character.eyes
    fill_in "Feat", with: @character.feat_id
    fill_in "Flaw", with: @character.flaw
    fill_in "Gender", with: @character.gender
    fill_in "Gold", with: @character.gold
    fill_in "Hair", with: @character.hair
    fill_in "Height", with: @character.height
    fill_in "Hp max", with: @character.hp_max
    fill_in "Ideal", with: @character.ideal
    fill_in "Languages", with: @character.languages
    fill_in "Player class", with: @character.player_class_id
    fill_in "Player name", with: @character.player_name
    fill_in "Race", with: @character.race_id
    fill_in "Silver", with: @character.silver
    fill_in "Size", with: @character.size
    fill_in "Skill prof", with: @character.skill_prof
    fill_in "Skin", with: @character.skin
    fill_in "Speed", with: @character.speed
    fill_in "Spell slots", with: @character.spell_slots
    fill_in "Spells", with: @character.spells
    fill_in "Tool prof", with: @character.tool_prof
    fill_in "Trait", with: @character.trait
    fill_in "User", with: @character.user_id
    fill_in "Weapon prof", with: @character.weapon_prof
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "should destroy Character" do
    visit character_url(@character)
    click_on "Destroy this character", match: :first

    assert_text "Character was successfully destroyed"
  end
end
