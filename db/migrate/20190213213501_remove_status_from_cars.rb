class RemoveStatusFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :status, :string
  end
end
