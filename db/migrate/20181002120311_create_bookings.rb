# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :renter, foreign_key: { to_table: :users }
      t.references :car, foreign_key: true
      t.integer :daily_price
      t.date :start_date
      t.date :end_date
      t.boolean :status

      t.timestamps
    end
  end
end
