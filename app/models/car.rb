class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :make
  belongs_to :model
  belongs_to :body_style

  validates :year, inclusion: 1960..2018
end
