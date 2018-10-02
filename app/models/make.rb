class Make < ApplicationRecord
  has_one :model
  has_many :cars

  validates_presence_of :name
end
