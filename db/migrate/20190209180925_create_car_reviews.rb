class CreateCarReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :car_reviews do |t|
      t.references :car, foreign_key: { to_table: :cars }
      t.string :text
      t.integer :rating

      t.timestamps
    end
  end
end
