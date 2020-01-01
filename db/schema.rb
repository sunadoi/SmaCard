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

ActiveRecord::Schema.define(version: 2020_01_01_095245) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "relation_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "benefit_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_list_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_list_id"], name: "index_benefit_lists_on_card_list_id"
  end

  create_table "benefits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "benefit_list_id"
    t.date "used_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_list_id"], name: "index_benefits_on_benefit_list_id"
  end

  create_table "card_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_card_lists_on_admin_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "user_id"
    t.bigint "relation_id"
    t.integer "point", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expiration"
    t.bigint "card_list_id"
    t.index ["card_list_id"], name: "index_cards_on_card_list_id"
  end

  create_table "cards_benefits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_cards_benefits_on_benefit_id"
    t.index ["card_id"], name: "index_cards_benefits_on_card_id"
  end

  create_table "cards_coupons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cards_coupons_on_card_id"
    t.index ["coupon_id"], name: "index_cards_coupons_on_coupon_id"
  end

  create_table "coupon_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_list_id"
    t.text "description"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_list_id"], name: "index_coupon_lists_on_card_list_id"
  end

  create_table "coupons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "coupon_list_id"
    t.date "used_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_list_id"], name: "index_coupons_on_coupon_list_id"
  end

  create_table "relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_list_id"
    t.string "name", null: false
    t.text "location", null: false
    t.time "opening_time", null: false
    t.time "closing_time", null: false
    t.string "tel", null: false
    t.text "url"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_list_id"], name: "index_relations_on_card_list_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "tel", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefit_lists", "card_lists"
  add_foreign_key "card_lists", "admins"
  add_foreign_key "cards", "card_lists"
  add_foreign_key "cards_benefits", "benefits"
  add_foreign_key "cards_benefits", "cards"
  add_foreign_key "cards_coupons", "cards"
  add_foreign_key "cards_coupons", "coupons"
  add_foreign_key "coupon_lists", "card_lists"
end
