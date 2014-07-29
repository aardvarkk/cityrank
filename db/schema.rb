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

ActiveRecord::Schema.define(version: 20140729175121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "original_rank"
    t.integer  "population"
    t.decimal  "popgrowth"
    t.decimal  "unemp_rate"
    t.decimal  "avg_hshld_income"
    t.decimal  "avg_disc_income"
    t.decimal  "avg_hshld_networth"
    t.decimal  "avg_house_price"
    t.decimal  "avg_years_to_buy_house"
    t.decimal  "property_tax"
    t.decimal  "avg_property_tax"
    t.decimal  "prop_tax_as_perc"
    t.decimal  "sales_tax"
    t.decimal  "income_tax"
    t.decimal  "new_cars"
    t.decimal  "new_luxury_cars"
    t.decimal  "walk_to_work"
    t.decimal  "bike_to_work"
    t.decimal  "transit_to_work"
    t.decimal  "rainfall"
    t.decimal  "days_with_precip"
    t.decimal  "days_with_rain"
    t.decimal  "days_above_0"
    t.decimal  "days_above_20"
    t.decimal  "days_above_24"
    t.decimal  "days_below_min20"
    t.decimal  "mean_daily_temp"
    t.decimal  "change_in_crime"
    t.decimal  "crime_per_100k"
    t.decimal  "crime_severity"
    t.decimal  "violent_crime_severity"
    t.decimal  "medical_offices_per_1k"
    t.decimal  "employed_in_health"
    t.decimal  "doctors_per_1k"
    t.decimal  "employed_in_arts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
