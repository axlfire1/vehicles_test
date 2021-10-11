# frozen_string_literal: true

module Vehicles
  class SearchVehicleModelService
    def execute(data)
      model_name = 'VehicleModel'.constantize
      repository.find(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleModelRepository.new
    end
  end
end
