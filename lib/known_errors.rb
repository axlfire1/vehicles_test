# frozen_string_literal: true

class KnownErrors
  class << self
    def invalid_parameters
      ErrorsHelper::UnprocessableEntity.new(code: '05')
    end

    def missing_parameters
      ErrorsHelper::UnprocessableEntity.new(code: '01')
    end
  end
end
