json.extract! hospital, :id, :name, :tel, :web, :approved, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
