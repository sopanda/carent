class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :text
      t.integer :rating

      t.timestamps
    end
  end
end
