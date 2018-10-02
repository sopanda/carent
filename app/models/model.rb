class Model < ApplicationRecord
  belongs_to :make
  has_many :car

  validates_presence_of :name
end
