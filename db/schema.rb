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

ActiveRecord::Schema.define(version: 2021_05_09_144646) do

  create_table "album_transactions", force: :cascade do |t|
    t.integer "library_transaction_id"
    t.integer "book_id"
    t.integer "transaction_length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_album_transactions_on_book_id"
    t.index ["library_transaction_id"], name: "index_album_transactions_on_library_transaction_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "artist"
    t.string "genre"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_transactions", force: :cascade do |t|
    t.integer "media_transaction_id"
    t.integer "book_id"
    t.integer "length_days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "reservation_end_date"
    t.index ["book_id"], name: "index_book_transactions_on_book_id"
    t.index ["media_transaction_id"], name: "index_book_transactions_on_media_transaction_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_path", default: "https://www.anglo-egyptian.com/books_posters/defbookcover.jpg?v=1528540330"
    t.integer "library_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "library_transactions", force: :cascade do |t|
    t.integer "library_id"
    t.datetime "expiration_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["library_id"], name: "index_library_transactions_on_library_id"
  end

  create_table "media_transactions", force: :cascade do |t|
    t.integer "library_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["library_id"], name: "index_media_transactions_on_library_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

end
