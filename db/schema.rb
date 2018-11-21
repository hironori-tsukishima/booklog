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

ActiveRecord::Schema.define(version: 20181120112010) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["content_id"], name: "index_comments_on_content_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",              limit: 65535, null: false
    t.text     "summary",            limit: 65535
    t.text     "text",               limit: 65535
    t.text     "image",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.bigint   "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_contents_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "contents"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "users"
end
