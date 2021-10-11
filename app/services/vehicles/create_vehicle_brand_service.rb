# frozen_string_literal: true

module Vehicles
  class CreateVehicleBrandService
    def execute(data)
      model_name = 'VehicleBrand'.constantize
      repository.create_from_params(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleBrandRepository.new
    end
  end
end
