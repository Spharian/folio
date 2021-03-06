# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150624064224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "position"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "marmoset_viewers", force: :cascade do |t|
    t.integer "project_id"
    t.text    "iframe_html"
    t.integer "position"
  end

  add_index "marmoset_viewers", ["project_id"], name: "index_marmoset_viewers_on_project_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["project_id"], name: "index_pictures_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "text"
    t.integer  "position"
    t.integer  "category_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "slug"
    t.integer  "featured_image_x",            default: 0,   null: false
    t.integer  "featured_image_y",            default: 0,   null: false
    t.float    "featured_image_scale",        default: 1.0
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
  end

  create_table "videos", force: :cascade do |t|
    t.integer "project_id"
    t.string  "video_link"
    t.integer "position"
  end

  add_index "videos", ["project_id"], name: "index_videos_on_project_id", using: :btree

end
