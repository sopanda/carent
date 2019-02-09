# frozen_string_literal: true

class Car::Review < ApplicationRecord
  belongs_to :car
  belongs_to :author, class_name: 'User'

  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :text, presence: true
end
