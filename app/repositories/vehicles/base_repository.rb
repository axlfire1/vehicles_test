# frozen_string_literal: true

module Vehicles
  class BaseRepository
    def create_from_params(model_name, params)
      model_name.create!(params)
    end

    def search(model_name, params)
      return filtered_search(model_name, params) if filter_present?(params)

      model_name.all
    end

    def find(model_name, params)
      model_name.find_by(params)
    end

    private

    def filter_present?(params)
      true if params.size > 0
    end

    def filtered_search(model_name, params)
      @table = model_name.arel_table
      query = prepare_query(**params)

      model_name
        .includes(:vehicle_model, :vehicle_brand)
        .joins(:vehicle_model)
        .joins(:vehicle_brand)
        .where(query)
    end

    def prepare_query(params)
      conditions = Arel::Nodes::True.new
      params.each { |field, value| conditions = conditional_case(field, value, conditions) }

      conditions
    end

    def conditional_case(field, value, conditions)
      case field
      when :model_name
        vehicle_model = VehicleModel.arel_table
        conditions.and(vehicle_model['name'].eq(value))
      when :brand_name
        vehicle_brand = VehicleBrand.arel_table
        conditions.and(vehicle_brand['name'].eq(value))
      when :year
        conditions.and(arel_filter('year', value.keys.first, value[value.keys.first]))
      when :mileage
        conditions.and(arel_filter('mileage', value.keys.first, value[value.keys.first]))
      when :price
        conditions.and(arel_filter('price', value.keys.first, value[value.keys.first]))
      else
        conditions.and(@table[field].eq(value))
      end
    end

    def arel_filter(kind, operator, data)
      case(operator)
      when :eq
        @table[kind].gteq(data).and(@table[kind].lteq(data))
      when :gt
        @table[kind].gt(data)
      when :lt
        @table[kind].lt(data)
      end
    end
  end
end
