class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :encrypted_ssn
      t.string :address
      t.string :city
      t.string :zip
      t.string :drivers_license_image
      t.string :current_image

      t.timestamps
    end
  end
end
