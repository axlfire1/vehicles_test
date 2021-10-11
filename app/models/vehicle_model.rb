# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand
  has_many :vehicles

  validates :name, uniqueness: true
end
