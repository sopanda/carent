# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cars, foreign_key: 'owner_id',                                   dependent: :destroy
  has_many :bookings, foreign_key: 'renter_id',                              dependent: :destroy
  has_many :written_reviews, foreign_key: 'author_id', class_name: 'Review', dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false },
                       format: { without: /\s/ }
  validates :first_name, :last_name, :email, presence: true
end
