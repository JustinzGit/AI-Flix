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

ActiveRecord::Schema.define(version: 2021_05_03_210615) do

  create_table "actors", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "birthday"
    t.string "deathday"
    t.string "biography"
    t.string "birthplace"
    t.string "image"
    t.string "imdb_id"
    t.boolean "data_collected", default: false
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "budget"
    t.string "revenue"
    t.string "overview"
    t.string "image"
    t.string "release_date"
    t.string "tagline"
    t.string "imdb_id"
    t.boolean "data_collected", default: false
  end

  create_table "path_actors", force: :cascade do |t|
    t.integer "path_id"
    t.integer "actor_id"
  end

  create_table "path_movies", force: :cascade do |t|
    t.integer "path_id"
    t.integer "movie_id"
  end

  create_table "paths", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "playlist_movies", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "movie_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.string "user_review"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "uid"
  end

end
