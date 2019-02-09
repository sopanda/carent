class AddMoreInfoToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :doors, :integer
    add_column :cars, :transmission, :string
    add_column :cars, :child_seat, :boolean
    add_column :cars, :fuel_type, :string
    add_column :cars, :mileage, :integer
    add_column :cars, :color, :string
  end
end
