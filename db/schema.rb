# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_30_062222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "skill_prof", default: [], array: true
    t.string "tool_prof", default: [], array: true
    t.string "languages", default: [], array: true
    t.string "equipment_choices", default: [], array: true
    t.string "equipment", default: [], array: true
    t.integer "gold"
    t.text "feature"
    t.string "traits", default: [], array: true
    t.string "ideals", default: [], array: true
    t.string "bonds", default: [], array: true
    t.string "flaws", default: [], array: true
    t.string "specialties", default: [], array: true
    t.string "specialty_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "race_id"
    t.integer "player_class_id"
    t.integer "background_id"
    t.integer "feat_id"
    t.integer "user_id"
    t.string "player_name"
    t.string "char_name"
    t.string "age"
    t.string "height"
    t.string "eyes"
    t.string "hair"
    t.string "skin"
    t.string "gender"
    t.string "description"
    t.string "languages", default: [], array: true
    t.string "weapon_prof", default: [], array: true
    t.string "armor_prof", default: [], array: true
    t.string "tool_prof", default: [], array: true
    t.string "skill_prof", default: [], array: true
    t.string "expertise", default: [], array: true
    t.string "size"
    t.integer "speed"
    t.integer "hp_max"
    t.string "equipment", default: [], array: true
    t.integer "gold"
    t.integer "silver"
    t.integer "copper"
    t.string "spells", default: [], array: true
    t.integer "spell_slots", default: [], array: true
    t.string "trait"
    t.string "ideal"
    t.string "bond"
    t.string "flaw"
    t.string "bkgd_specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_classes", force: :cascade do |t|
    t.string "name"
    t.integer "hit_die"
    t.integer "starting_hp"
    t.integer "primary_abilities", default: [], array: true
    t.integer "saving_throws", default: [], array: true
    t.string "armor_prof", default: [], array: true
    t.string "weapon_prof", default: [], array: true
    t.string "tool_prof", default: [], array: true
    t.string "skill_choices", default: [], array: true
    t.integer "num_skills"
    t.string "equipment_choices", default: [], array: true
    t.string "equipment", default: [], array: true
    t.integer "spellcasting_ability"
    t.integer "num_cantrips"
    t.integer "num_spells"
    t.integer "spell_list", default: [], array: true
    t.integer "wealth_die"
    t.integer "wealth_mult"
    t.string "features", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "asi", default: [0, 0, 0, 0, 0, 0], array: true
    t.integer "age_limit", default: 500
    t.string "heightlow", default: "4'6\""
    t.string "heighthigh", default: "7\"6"
    t.string "languages", default: [], array: true
    t.integer "extra_languages", default: 0
    t.string "weapons", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "tool_choice", default: [], array: true
    t.string "size", default: "medium"
    t.integer "speed", default: 15
    t.string "racial_traits", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
