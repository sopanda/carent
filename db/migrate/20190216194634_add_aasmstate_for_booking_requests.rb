class AddAasmstateForBookingRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :aasm_state, :string
  end
end
