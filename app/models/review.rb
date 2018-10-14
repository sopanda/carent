class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates_presence_of :text
  #validates_with ::ReviewValidator
end
