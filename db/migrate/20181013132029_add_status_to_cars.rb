class AddStatusToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :status, :string
  end
end
