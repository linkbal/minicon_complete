class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_at
      t.integer :ticket_price
      t.integer :ticket_quantity
      t.integer :event_category_id

      t.timestamps
    end
  end
end
