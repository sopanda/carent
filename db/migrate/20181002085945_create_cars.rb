class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.references :car_make, foreign_key: true
      t.references :car_model, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
