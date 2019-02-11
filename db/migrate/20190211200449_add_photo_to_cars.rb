class AddPhotoToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :photo, :string
  end
end
