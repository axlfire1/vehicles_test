# frozen_string_literal: true

module Vehicles
  class CreateVehicleStrategy
    def execute(data)
      @data = data
      process
    end

    private

    attr_accessor :data

    def process
      model_from_db = lookup_model
      raise ActiveRecord::RecordNotFound if model_from_db.nil?

      add_new_vehicle(model_from_db)
    end

    def lookup_model
      required_params = { name: data[:model] }
      find_service.execute(required_params)
    end

    def add_new_vehicle(model_from_db)
      required_params = {
        vehicle_model_id: model_from_db.id,
        year: data[:year],
        price: data[:price],
        mileage: data[:mileage]
      }

      create_vehicle_service.execute(required_params)
    end

    def create_vehicle_service
      @create_vehicle_service ||= Vehicles::CreateVehicleService.new
    end

    def find_service
      @find_service ||= Vehicles::SearchVehicleModelService.new
    end
  end
end
