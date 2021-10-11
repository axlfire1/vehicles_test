# frozen_string_literal: true

class CreateVehicle < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model, null: false
      t.integer :year, null: false
      t.string :mileage, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
