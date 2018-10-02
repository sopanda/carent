class User < ApplicationRecord
  has_secure_password
  
  has_many :cars, foreign_key: 'owner_id'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
  validates_presence_of :first_name, :last_name
end
