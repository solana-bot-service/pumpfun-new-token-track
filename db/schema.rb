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

ActiveRecord::Schema[7.1].define(version: 2024_01_21_203203) do
  create_table "pools", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.integer "liquidity"
    t.integer "protocol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["protocol_id"], name: "index_pools_on_protocol_id"
  end

  create_table "pools_tokens", id: false, force: :cascade do |t|
    t.integer "pool_id"
    t.integer "token_id"
    t.index ["pool_id"], name: "index_pools_tokens_on_pool_id"
    t.index ["token_id"], name: "index_pools_tokens_on_token_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "ticker"
    t.string "address"
    t.integer "market_cap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pools", "protocols"
end
