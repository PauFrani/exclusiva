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

ActiveRecord::Schema.define(version: 2019_11_06_221702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "street"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "biddings", force: :cascade do |t|
    t.integer "amount"
    t.string "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_biddings_on_addressable_type_and_addressable_id"
    t.index ["user_id"], name: "index_biddings_on_user_id"
  end

  create_table "brand_ranks", force: :cascade do |t|
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bidding_id"
    t.integer "order"
    t.index ["bidding_id"], name: "index_brand_ranks_on_bidding_id"
    t.index ["brand_id"], name: "index_brand_ranks_on_brand_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "status"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_payments_on_purchase_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url_photo"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.integer "stock"
    t.bigint "showroom_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
    t.index ["showroom_id"], name: "index_product_items_on_showroom_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "min_price"
    t.float "max_price"
    t.string "category"
    t.string "description"
    t.string "sku_ext"
    t.boolean "published"
    t.bigint "showroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["showroom_id"], name: "index_products_on_showroom_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "qr"
    t.string "payment_method"
    t.bigint "product_item_id"
    t.bigint "bidding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["bidding_id"], name: "index_purchases_on_bidding_id"
    t.index ["product_item_id"], name: "index_purchases_on_product_item_id"
  end

  create_table "showrooms", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_showrooms_on_addressable_type_and_addressable_id"
    t.index ["brand_id"], name: "index_showrooms_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birth_date"
    t.string "photo"
    t.boolean "status"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_users_on_addressable_type_and_addressable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "color"
    t.string "size"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "biddings", "users"
  add_foreign_key "brand_ranks", "biddings"
  add_foreign_key "brand_ranks", "brands"
  add_foreign_key "payments", "purchases"
  add_foreign_key "photos", "products"
  add_foreign_key "product_items", "products"
  add_foreign_key "product_items", "showrooms"
  add_foreign_key "products", "showrooms"
  add_foreign_key "purchases", "biddings"
  add_foreign_key "purchases", "product_items"
  add_foreign_key "showrooms", "brands"
  add_foreign_key "variants", "products"
end
