# frozen_string_literal: true

class RenameDailyPriceToPriceInBooking < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :daily_price, :price
  end
end
