# frozen_string_literal: true

module Vehicles
  class SearchVehicleService
    def execute(data)
      model_name = 'Vehicle'.constantize
      repository.search(model_name, data)
    end

    private

    def repository
      @repository ||= Vehicles::VehicleRepository.new
    end
  end
end
