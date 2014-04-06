json.array!(@users) do |user|
  json.extract! user, :username, :first_name, :last_name, :email, :password_digest, :remember_token, :password_reset_token, :password_reset_sent_at, :role
  json.url user_url(user, format: :json)
end