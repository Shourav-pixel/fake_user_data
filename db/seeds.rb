# db/seeds.rb

require 'faker'
require_relative '../app/services/data_generator'

include DataGenerator

error_rate = 0.1 # Example error rate (adjust as needed)

# Define seed data for each region
regions = ['Poland', 'USA', 'Georgia']

regions.each do |region|
  20.times do
    first_name, middle_name, last_name = generate_name(region).split(' ')
    address = generate_address(region)
    phone = generate_phone(region)

    first_name = apply_error(first_name, error_rate)
    middle_name = apply_error(middle_name, error_rate)
    last_name = apply_error(last_name, error_rate)
    address = apply_error(address, error_rate)
    phone = apply_error(phone, error_rate)

    User.create(
      region: region,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      address: address,
      phone: phone,
  
    )
  end
end
