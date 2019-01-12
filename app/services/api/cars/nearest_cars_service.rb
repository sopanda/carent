# frozen_string_literal: true

module Api
  module Cars
    class NearestCarsService
      include Virtus.model
      include ActiveModel::Validations

      attribute :latitude,  ::String
      attribute :longitude, ::String
      attribute :range,     ::Float

      attribute :data,      ::Car, lazy: true, default: :fetch_nearest_cars

      validates_presence_of :latitude, :longitude, :range

      def call
        return unless valid?
        data
      end

      private

      def fetch_nearest_cars
        Car.near([latitude, longitude], range)
      end
    end
  end
end
