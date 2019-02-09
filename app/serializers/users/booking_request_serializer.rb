# frozen_string_literal: true

module Users
  class BookingRequestSerializer < ActiveModel::Serializer
    attributes :id, :car, :sender

    belongs_to :car
    belongs_to :sender
  end
end
