json.array!(@customers) do |customer|
  json.extract! customer, :first_name, :last_name, :middle_name, :encrypted_ssn, :address, :city, :zip, :drivers_license_image, :current_image
  json.url customer_url(customer, format: :json)
end