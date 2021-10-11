# frozen_string_literal: true

module V1
  class VehiclesController < ApplicationController
    def create
      schema = Schemas::V1::Vehicles::PostSchema
      data = validate_request(params.permit!.to_h, schema)
      new_vehicle = Vehicles::CreateVehicleStrategy.new.execute(data)

      render json: new_vehicle, serializer: serializer, status: :created
    end

    def index
      schema = Schemas::V1::Vehicles::IndexSchema
      data = validate_request(params.permit!.to_h, schema)
      vehicles = Vehicles::SearchVehicleService.new.execute(data)

      render json: vehicles, each_serializer: serializer, status: :ok
    end

    private

    def serializer
      @serializer ||= Vehicles::VehiclesSerializer
    end
  end
end
