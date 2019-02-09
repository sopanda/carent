class UpdateAddressTypeInCar < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :address, :jsonb, using: 'address::text::jsonb'
  end
end
