json.extract! user, :id, :username, :password_hash, :type_of_user, :created_at, :updated_at
json.url user_url(user, format: :json)
