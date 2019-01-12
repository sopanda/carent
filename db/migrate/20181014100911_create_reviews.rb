# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.integer :booking_id
      t.string :text
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, :author_id
    add_index :reviews, :booking_id
  end
end
