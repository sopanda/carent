class BodyStyle < ApplicationRecord
  has_many :cars

  validates_presence_of :name
end
