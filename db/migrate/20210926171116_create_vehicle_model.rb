# frozen_string_literal: true

class CreateVehicleModel < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_models do |t|
      t.references :vehicle_brand, null: false
      t.string     :name, null: false

      t.timestamps
    end
  end
end
