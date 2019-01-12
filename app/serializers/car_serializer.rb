# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :status, :daily_price, :owner, :address

  belongs_to :owner

  def address
    JSON.parse object.address.tr(':', '"').tr('=>', ' :')
  end
end
