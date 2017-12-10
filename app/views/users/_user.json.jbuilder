json.extract! user, :id, :email, :password, :role, :hospital, :approved, :created_at, :updated_at
json.url user_url(user, format: :json)
