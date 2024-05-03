# app/services/data_generator.rb

module DataGenerator
    extend ActiveSupport::Concern
  
    included do
      # Existing code...
    end
  
    # Debugging statements to check the return values of generate_name, generate_address, and generate_phone
    def generate_name(region)
      name = case region.downcase
             when 'poland'
               Faker::Name.unique.name_with_middle
             when 'usa'
               Faker::Name.unique.name
             when 'georgia'
               Faker::Name.unique.name
             else
               Faker::Name.unique.name_with_middle
             end
      puts "Generated name for #{region}: #{name.inspect}"
      name
    end
  
    def generate_address(region)
      address = case region.downcase
                when 'poland'
                  Faker::Address.unique.full_address
                when 'usa'
                  Faker::Address.unique.full_address
                when 'georgia'
                  Faker::Address.unique.full_address
                else
                  Faker::Address.unique.full_address
                end
      puts "Generated address for #{region}: #{address.inspect}"
      address
    end
  
    def generate_phone(region)
      phone = case region.downcase
              when 'poland'
                Faker::PhoneNumber.unique.phone_number
              when 'usa'
                Faker::PhoneNumber.unique.phone_number
              when 'georgia'
                Faker::PhoneNumber.unique.phone_number
              else
                Faker::PhoneNumber.unique.phone_number
              end
      puts "Generated phone for #{region}: #{phone.inspect}"
      phone
    end
  
    # Method to apply errors
    def apply_error(data, error_rate)
      return data if data.nil? || rand > error_rate
  
      # Choose a random error type
      error_type = rand(3)
  
      case error_type
      when 0
        # Delete random character
        index = rand(data.length)
        data.slice!(index)
      when 1
        # Insert random character
        index = rand(data.length)
        data.insert(index, Faker::Lorem.characters(number: 1))
      when 2
        # Swap nearby characters
        index = rand(data.length - 1)
        data[index], data[index + 1] = data[index + 1], data[index]
      end
  
      data
    end
end
  