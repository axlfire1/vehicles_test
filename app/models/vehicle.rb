# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  has_one :vehicle_brand, through: :vehicle_model
end
