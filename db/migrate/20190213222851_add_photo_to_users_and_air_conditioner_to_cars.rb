class AddPhotoToUsersAndAirConditionerToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :air_conditioner, :boolean
    add_column :users, :photo, :string
  end
end
