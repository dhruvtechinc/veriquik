class AddApiKey < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.belongs_to :users
      t.string :api_key, :unique => true
      t.string :client_private_key

      t.timestamps
    end
  end
end
