# frozen_string_literal: true

class AddDailyPriceToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :daily_price, :integer
  end
end
