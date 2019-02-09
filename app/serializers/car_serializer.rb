# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :status, :daily_price, :owner, :address

  belongs_to :owner
end
