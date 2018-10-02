class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.references :make, foreign_key: true
      t.references :model, foreign_key: true
      t.integer :year
      t.references :body_style, foreign_key: true

      t.timestamps
    end
  end
end
