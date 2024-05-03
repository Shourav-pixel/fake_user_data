json.extract! user, :id, :region, :first_name, :middle_name, :last_name, :address, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
