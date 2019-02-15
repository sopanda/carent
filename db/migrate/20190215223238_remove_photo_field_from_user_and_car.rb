class RemovePhotoFieldFromUserAndCar < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :photo, :string
    remove_column :users, :photo, :string
  end
end
