# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  include AASM

  aasm do
    state :unverified, initial: true
    state :verified

    event :verify do
      transitions from: :unverified, to: :verified
    end

    event :unverify do
      transitions from: :verified, to: :unverified
    end
  end

  has_one_attached :photo
  has_one_attached :verify_document

  has_many :cars,     foreign_key: 'owner_id',    dependent: :destroy
  has_many :bookings, foreign_key: 'renter_id',   dependent: :destroy
  has_many :reviews,  class_name: 'User::Review', dependent: :destroy

  has_many :written_car_reviews,  class_name: 'Car::Review',  foreign_key: 'author_id', dependent: :destroy
  has_many :written_user_reviews, class_name: 'User::Review', foreign_key: 'author_id', dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, format: { without: /\s/ } # add uniqness in external validation
  validates :first_name, :last_name, :email, :username, presence: true
  validates :photo, content_type: ["image/png", "image/jpeg"], allow_blank: true
  validates :verify_document, content_type: ["image/png", "image/jpeg", "application/pdf"], allow_blank: true
end
