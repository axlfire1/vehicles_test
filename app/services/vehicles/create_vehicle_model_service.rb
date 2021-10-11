# frozen_string_literal: true

module Vehicles
  class CreateVehicleModelService
    def execute(data)
      model_name = 'VehicleModel'.constantize
      repository.create_from_params(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleModelRepository.new
    end
  end
end
