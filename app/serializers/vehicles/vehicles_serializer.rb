# frozen_string_literal: true

module Vehicles
  class VehiclesSerializer < ActiveModel::Serializer
    attributes :id, :model_name, :brand_name, :year, :mileage, :price

    def model_name
      object.vehicle_model.name
    end

    def brand_name
      object.vehicle_model.vehicle_brand.name
    end

    def mileage
      object.mileage.to_i
    end
  end
end
