class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :status, default: 0
      t.integer :ticket_quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
