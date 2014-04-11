class CreateVerificationOrders < ActiveRecord::Migration
  def change
    create_table :verification_orders do |t|
      t.belongs_to :users, :customers	
      t.string :status

      t.timestamps
    end
  end
end
