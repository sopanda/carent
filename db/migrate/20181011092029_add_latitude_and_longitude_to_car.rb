# frozen_string_literal: true

class AddLatitudeAndLongitudeToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :latitude, :float
    add_column :cars, :longitude, :float
    add_column :cars, :address, :string
  end
end
