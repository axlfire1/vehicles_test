# frozen_string_literal: true

module Vehicles
  class CreateVehicleModelStrategy
    def execute(data)
      @data = data
      process
    end

    private

    attr_accessor :data

    def process
      brand = lookup_brand
      new_brand = add_new_vehicle_brand if brand.nil?
      db_brand = brand || new_brand

      add_new_vehicle_model(db_brand)
    end

    def lookup_brand
      required_params = { name: data[:brand] }
      find_service.execute(required_params)
    end

    def add_new_vehicle_brand
      required_params = { name: data[:brand] }
      create_brand_service.execute(required_params)
    end

    def add_new_vehicle_model(db_brand)
      required_params = {
        name: data[:name],
        vehicle_brand_id: db_brand.id
      }

      create_model_service.execute(required_params)
    end

    def create_model_service
      @create_model_service ||= Vehicles::CreateVehicleModelService.new
    end

    def create_brand_service
      @create_brand_service ||= Vehicles::CreateVehicleBrandService.new
    end

    def find_service
      @find_service ||= Vehicles::SearchVehicleBrandService.new
    end
  end
end
