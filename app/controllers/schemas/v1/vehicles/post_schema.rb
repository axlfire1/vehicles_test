# frozen_string_literal: true

module Schemas
  module V1
    module Vehicles
      PostSchema = Dry::Schema.Params do
        config.validate_keys = true

        required(:brand).value(:str?)
        required(:model).value(:str?)
        required(:year).value(:str?)
        required(:price).value(:integer)
        required(:mileage).value(:integer)
      end
    end
  end
end
