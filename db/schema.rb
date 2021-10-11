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

ActiveRecord::Schema.define(version: 20_210_926_171_132) do
  create_table 'vehicle_brands', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'vehicle_models', force: :cascade do |t|
    t.integer 'vehicle_brand_id', null: false
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['vehicle_brand_id'], name: 'index_vehicle_models_on_vehicle_brand_id'
  end

  create_table 'vehicles', force: :cascade do |t|
    t.integer 'vehicle_model_id', null: false
    t.integer 'year', null: false
    t.string 'mileage', null: false
    t.integer 'price', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['vehicle_model_id'], name: 'index_vehicles_on_vehicle_model_id'
  end
end
