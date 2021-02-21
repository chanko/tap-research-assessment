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

ActiveRecord::Schema.define(version: 2021_02_21_222600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_quotas", force: :cascade do |t|
    t.integer "api_id"
    t.bigint "campaign_id", null: false
    t.integer "num_respondendts"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_id"], name: "index_campaign_quotas_on_api_id"
    t.index ["campaign_id"], name: "index_campaign_quotas_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "api_id"
    t.integer "length_of_interview"
    t.string "cpi"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_id"], name: "index_campaigns_on_api_id"
  end

  add_foreign_key "campaign_quotas", "campaigns"
end
