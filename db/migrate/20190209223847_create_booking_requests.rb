class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :car_booking_requests do |t|
      t.references :car, foreign_key: true
      t.references :sender, foreign_key: { to_table: :users }
    end
  end
end
