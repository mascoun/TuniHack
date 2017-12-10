# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171209220618) do

  create_table "blocks", force: :cascade do |t|
    t.integer  "index",      default: 1
    t.string   "data",       default: "--- []\n"
    t.string   "blockHash"
    t.integer  "block_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["block_id"], name: "index_blocks_on_block_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "category"
    t.integer  "number"
    t.integer  "hospital_id"
    t.boolean  "approved",    default: false
    t.string   "blockHash"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["hospital_id"], name: "index_equipment_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "distance"
    t.string   "place"
    t.string   "tel"
    t.string   "web"
    t.boolean  "approved",    default: false
    t.string   "blockHash"
    t.string   "photo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "object"
    t.string   "id_object"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.integer  "hospital_id"
    t.boolean  "approved",        default: false
    t.string   "blockHash"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
  end

end
