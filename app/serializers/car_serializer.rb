# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :status, :daily_price, :latitude, :longitude, :owner, :address

  belongs_to :owner
end
