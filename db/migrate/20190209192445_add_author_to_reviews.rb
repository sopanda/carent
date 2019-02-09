class AddAuthorToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :car_reviews, :author_id, :integer
    add_column :user_reviews, :author_id, :integer
  end
end
