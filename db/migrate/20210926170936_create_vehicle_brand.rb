# frozen_string_literal: true

class CreateVehicleBrand < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_brands do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
