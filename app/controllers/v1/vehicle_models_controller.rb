# frozen_string_literal: true

module V1
  class VehicleModelsController < ApplicationController
    def create
      schema = Schemas::V1::VehicleModels::PostSchema
      data = validate_request(params.permit!.to_h, schema)
      new_model = Vehicles::CreateVehicleModelStrategy.new.execute(data)

      render json: new_model, status: :created
    end
  end
end
