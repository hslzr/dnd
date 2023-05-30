require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url
    assert_response :success
  end

  test "should get new" do
    get new_character_url
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post characters_url, params: { character: { age: @character.age, armor_prof: @character.armor_prof, background_id: @character.background_id, bkgd_specialty: @character.bkgd_specialty, bond: @character.bond, char_name: @character.char_name, copper: @character.copper, description: @character.description, equipment: @character.equipment, expertise: @character.expertise, eyes: @character.eyes, feat_id: @character.feat_id, flaw: @character.flaw, gender: @character.gender, gold: @character.gold, hair: @character.hair, height: @character.height, hp_max: @character.hp_max, ideal: @character.ideal, languages: @character.languages, player_class_id: @character.player_class_id, player_name: @character.player_name, race_id: @character.race_id, silver: @character.silver, size: @character.size, skill_prof: @character.skill_prof, skin: @character.skin, speed: @character.speed, spell_slots: @character.spell_slots, spells: @character.spells, tool_prof: @character.tool_prof, trait: @character.trait, user_id: @character.user_id, weapon_prof: @character.weapon_prof } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should show character" do
    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { age: @character.age, armor_prof: @character.armor_prof, background_id: @character.background_id, bkgd_specialty: @character.bkgd_specialty, bond: @character.bond, char_name: @character.char_name, copper: @character.copper, description: @character.description, equipment: @character.equipment, expertise: @character.expertise, eyes: @character.eyes, feat_id: @character.feat_id, flaw: @character.flaw, gender: @character.gender, gold: @character.gold, hair: @character.hair, height: @character.height, hp_max: @character.hp_max, ideal: @character.ideal, languages: @character.languages, player_class_id: @character.player_class_id, player_name: @character.player_name, race_id: @character.race_id, silver: @character.silver, size: @character.size, skill_prof: @character.skill_prof, skin: @character.skin, speed: @character.speed, spell_slots: @character.spell_slots, spells: @character.spells, tool_prof: @character.tool_prof, trait: @character.trait, user_id: @character.user_id, weapon_prof: @character.weapon_prof } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete character_url(@character)
    end

    assert_redirected_to characters_url
  end
end
