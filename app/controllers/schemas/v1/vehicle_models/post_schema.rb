# frozen_string_literal: true

module Schemas
  module V1
    module VehicleModels
      PostSchema = Dry::Schema.Params do
        config.validate_keys = true

        required(:name).value(:str?)
        required(:brand).value(:str?)
      end
    end
  end
end
