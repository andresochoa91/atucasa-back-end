# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_25_215642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.string "phone_number"
    t.text "profile_picture"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "site_name"
    t.string "url"
    t.integer "merchant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id"], name: "index_links_on_merchant_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "address"
    t.integer "zip_code"
    t.text "details"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "merchant_name"
    t.string "slug"
    t.string "phone_number"
    t.string "tax_id"
    t.text "description"
    t.text "profile_picture"
    t.text "background_picture"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_merchants_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "merchant_id"
    t.boolean "accepted"
    t.boolean "canceled"
    t.text "message"
    t.string "current_user"
    t.float "tip"
    t.float "delivery_fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["merchant_id"], name: "index_orders_on_merchant_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.string "product_name"
    t.float "price"
    t.float "tax"
    t.integer "amount"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_product_orders_on_order_id"
    t.index ["product_id"], name: "index_product_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "description"
    t.string "category"
    t.float "price"
    t.boolean "available"
    t.string "product_picture"
    t.float "tax"
    t.integer "merchant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id"], name: "index_products_on_merchant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
