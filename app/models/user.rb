# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cars,     foreign_key: 'owner_id',    dependent: :destroy
  has_many :bookings, foreign_key: 'renter_id',   dependent: :destroy
  has_many :reviews,  class_name: 'User::Review', dependent: :destroy

  has_many :written_car_reviews,  class_name: 'Car::Review',  foreign_key: 'author_id'
  has_many :written_user_reviews, class_name: 'User::Review', foreign_key: 'author_id'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false },
                       format: { without: /\s/ }
  validates :first_name, :last_name, :email, presence: true
end
