class AddDateAndDescriptionToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :start_date, :date
    add_column :cars, :end_date, :date
    add_column :cars, :description, :text
  end
end
