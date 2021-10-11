# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicle models', type: :request do
  let(:endpoint) { '/v1/vehicle_models' }

  describe 'POST' do
    context 'success' do
      it 'creates new model and brand' do
        params = {
          "name": 'Golf',
          "brand": 'VW'
        }

        expect(VehicleBrand.count).to eq(0)

        request_endpoint(:post, endpoint, params)

        response_body = JSON.parse(body)
        expect(response_body['name']).to eq('Golf')
        expect(status).to eq(201)
      end

      it 'creates new model from existing brand' do
        VehicleBrand.create(name: 'VW')

        params = {
          "name": 'Golf',
          "brand": 'VW'
        }

        request_endpoint(:post, endpoint, params)

        response_body = JSON.parse(body)
        expect(response_body['name']).to eq('Golf')
        expect(status).to eq(201)
      end
    end

    context 'failure' do
      it 'has invalid params' do
        params = {
          "name": 2,
          "brand": 'VW'
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body['message']).to eq('Parameters are invalid')
      end

      it 'has missing params' do
        params = {
          "brand": 'VW'
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body['message']).to eq('Missing Parameter')
      end

      it 'has a name already registered' do
        brand = VehicleBrand.create(name: 'VW')
        VehicleModel.create(name: 'Golf', vehicle_brand_id: brand.id)

        expect(VehicleModel.count).to eq(1)

        params = {
          "name": 'Golf',
          "brand": 'VW'
        }

        request_endpoint(:post, endpoint, params)
        response_body = JSON.parse(body)

        expect(response_body).to eq('Validation failed: Name has already been taken')
      end
    end
  end
end
