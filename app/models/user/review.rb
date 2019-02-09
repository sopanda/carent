# frozen_string_literal: true

class User::Review < ApplicationRecord
  belongs_to :user

  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :text, presence: true
end
