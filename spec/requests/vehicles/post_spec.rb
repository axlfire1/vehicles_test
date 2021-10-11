# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicles', type: :request do
  let(:endpoint) { '/v1/vehicles' }

  describe 'POST' do
    context 'success' do
      it 'creates new model and brand' do
        expect(VehicleBrand.count).to eq(0)
        expect(VehicleModel.count).to eq(0)
        expect(Vehicle.count).to eq(0)

        brand = VehicleBrand.create(name: 'VW')
        VehicleModel.create(name: 'Golf', vehicle_brand_id: brand.id)

        expect(VehicleBrand.count).to eq(1)
        expect(VehicleModel.count).to eq(1)
        expect(Vehicle.count).to eq(0)

        params = {
          brand: 'VW',
          model: 'Golf',
          year: '2020',
          price: 100_000,
          mileage: 50_000
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body['model_name']).to eq('Golf')
        expect(response_body['brand_name']).to eq('VW')
        expect(response_body['year']).to eq(2020)
        expect(response_body['mileage']).to eq(50_000)
        expect(response_body['price']).to eq(100_000)
        expect(status).to eq(201)
      end
    end

    context 'failure' do
      it 'has invalid params' do
        params = {
          brand: 'VW',
          model: 0,
          year: '2020',
          price: 100_000,
          mileage: 50_000
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body['message']).to eq('Parameters are invalid')
      end

      it 'has missing params' do
        params = {
          brand: 'VW',
          model: 'Golf',
          price: 100_000,
          mileage: 50_000
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body['message']).to eq('Missing Parameter')
      end
    end
  end
end
