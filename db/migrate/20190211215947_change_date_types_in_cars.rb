class ChangeDateTypesInCars < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :start_date, :datetime
    change_column :cars, :end_date, :datetime
  end
end
