# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicles', type: :request do
  let(:endpoint) { '/v1/vehicles' }
  before(:each) { common_process }

  describe 'POST' do
    context 'success' do
      it 'list with no filters' do
        request_endpoint(:get, endpoint)
        response_body = JSON.parse(body)

        expect(status).to eq(200)
        expect(response_body.size).to eq(4)
        expect(response_body.first['id']).to eq(1)
        expect(response_body.first['model_name']).to eq('Golf')
        expect(response_body.first['brand_name']).to eq('VW')
        expect(response_body.first['year']).to eq(2020)
        expect(response_body.first['mileage']).to eq(4000)
        expect(response_body.first['price']).to eq(10_000)
      end

      it 'list with filters' do
        request_endpoint(:get, "#{endpoint}?year[eq]=2020&model_name=Golf&brand_name=VW")
        response_body = JSON.parse(body)

        expect(status).to eq(200)
        expect(response_body.size).to eq(1)
        expect(response_body.first['id']).to eq(1)
        expect(response_body.first['model_name']).to eq('Golf')
        expect(response_body.first['brand_name']).to eq('VW')
        expect(response_body.first['year']).to eq(2020)
        expect(response_body.first['mileage']).to eq(4000)
        expect(response_body.first['price']).to eq(10_000)
      end
    end
  end

  def common_process
    brand1 = VehicleBrand.create(name: 'VW')
    vehicle_model1 = VehicleModel.create(name: 'Golf', vehicle_brand_id: brand1.id)
    Vehicle.create!(
      vehicle_model_id: vehicle_model1.id,
      year: 2020,
      mileage: 4000,
      price: 10_000
    )

    brand2 = VehicleBrand.create(name: 'Audi')
    vehicle_model2 = VehicleModel.create(name: 'A1', vehicle_brand_id: brand2.id)
    Vehicle.create!(
      vehicle_model_id: vehicle_model2.id,
      year: 2019,
      mileage: 3000,
      price: 20_000
    )

    vehicle_model3 = VehicleModel.create(name: 'Sedan', vehicle_brand_id: brand1.id)
    Vehicle.create!(
      vehicle_model_id: vehicle_model1.id,
      year: 2018,
      mileage: 2000,
      price: 30_000
    )

    vehicle_model3 = VehicleModel.create(name: 'Saveiro', vehicle_brand_id: brand1.id)
    Vehicle.create!(
      vehicle_model_id: vehicle_model1.id,
      year: 2017,
      mileage: 1000,
      price: 40_000
    )
  end
end
