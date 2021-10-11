brands = [
  {
    # id: 1,
    name: 'VW'
  },
  {
    name: 'Chevrolet'
  },
  {
    name: 'BMW'
  }
]
VehicleBrand.create!(brands)


models = [
  {
    # id: 1,
    vehicle_brand_id: 1,
    name: 'Golf'
  },
  {
    vehicle_brand_id: 2,
    name: 'Blazer'
  },
  {
    vehicle_brand_id: 3,
    name: 'Serie 1'
  }
]
VehicleModel.create!(models)

Vehicle.create!(
  # id: 1,
  vehicle_model_id: 1,
  year: 2021,
  mileage: 10000,
  price: 7800000
)
