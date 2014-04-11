json.array!(@verification_orders) do |verification_order|
  json.extract! verification_order, :users_id, :customers_id, :status
  json.url verification_order_url(verification_order, format: :json)
end