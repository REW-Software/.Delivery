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

ActiveRecord::Schema.define(version: 2021_07_01_192449) do

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "number"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sale_id"
    t.integer "quantity_product"
    t.integer "discount"
    t.index ["sale_id"], name: "index_products_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "payment_type", null: false
    t.string "name_client", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_id", null: false
    t.index ["post_id"], name: "index_sales_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.string "email"
    t.string "cpf"
    t.string "rg"
    t.string "type_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "products", "sales"
  add_foreign_key "sales", "posts"
end
