# frozen_string_literal: true

module Schemas
  module V1
    module Vehicles
      IndexSchema = Dry::Schema.Params do
        config.validate_keys = true

        optional(:model_name).value(:str?)
        optional(:brand_name).value(:str?)
        optional(:year).hash do
          optional(:gt).value(:integer)
          optional(:eq).value(:integer)
          optional(:lt).value(:integer)
        end
        optional(:mileage).hash do
          optional(:gt).value(:integer)
          optional(:eq).value(:integer)
          optional(:lt).value(:integer)
        end
        optional(:price).hash do
          optional(:gt).value(:integer)
          optional(:eq).value(:integer)
          optional(:lt).value(:integer)
        end
      end
    end
  end
end
