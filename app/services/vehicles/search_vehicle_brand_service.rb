# frozen_string_literal: true

module Vehicles
  class SearchVehicleBrandService
    def execute(data)
      model_name = 'VehicleBrand'.constantize
      repository.find(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleBrandRepository.new
    end
  end
end
