# frozen_string_literal: true

module Vehicles
  class CreateVehicleService
    def execute(data)
      model_name = 'Vehicle'.constantize
      repository.create_from_params(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleRepository.new
    end
  end
end
