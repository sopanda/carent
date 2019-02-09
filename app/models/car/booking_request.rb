# frozen_string_literal: true

class Car::BookingRequest < ApplicationRecord
  belongs_to :car
  belongs_to :sender, class_name: 'User'
  # one request per car validation
  # cant send request to own car
end
