# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_104_050_024) do
  create_table 'attendances', charset: 'utf8', force: :cascade do |t|
    t.datetime 'work_in'
    t.datetime 'break_in'
    t.datetime 'break_out'
    t.datetime 'work_out'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.integer 'break_time', default: 0
    t.index ['user_id'], name: 'index_attendances_on_user_id'
  end

  create_table 'users', charset: 'utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'attendances', 'users'
end
