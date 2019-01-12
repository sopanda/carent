# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
