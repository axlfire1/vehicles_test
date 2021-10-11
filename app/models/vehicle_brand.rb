# frozen_string_literal: true

class VehicleBrand < ApplicationRecord
  has_many :vehicle_models
  has_many :vehicles, through: :vehicle_models

  validates :name, uniqueness: true, on: %i[create update]
end
