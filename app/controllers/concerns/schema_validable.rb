# frozen_string_literal: true

require 'known_errors'

module SchemaValidable
  def validate_request(request_data, schema)
    validation = schema.call(request_data.except(:action, :controller, data_selection(request_data)))
    raise_error(validation) if validation.failure?

    validation.to_h
  end

  private

  FIRST_POSITION = 0
  LAST_POSITION  = -2

  def raise_error(validated_params)
    case validated_params.errors.messages.first.text
    when 'is missing'
      raise KnownErrors.missing_parameters
    else
      raise KnownErrors.invalid_parameters
    end
  end

  def data_selection(request_data)
    controller_name(request_data)[FIRST_POSITION..LAST_POSITION].to_sym
  end

  def controller_name(request_data)
    request_data[:controller]
      .gsub('v1', '')
      .gsub('/', '')
  end
end
