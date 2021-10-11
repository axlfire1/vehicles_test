# frozen_string_literal: true

module ErrorsHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |_error|
      render status: :not_found
    end

    rescue_from ActionController::RoutingError do
      render status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      render json: error, status: :unprocessable_entity
    end

    rescue_from ErrorsHelper::UnprocessableEntity do |error|
      render json: error.to_h, status: :unprocessable_entity
    end
  end
end
