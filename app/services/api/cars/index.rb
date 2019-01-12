# frozen_string_literal: true

module Api
  module Cars
    class Index
      include Virtus.model
      include ActiveModel::Validations

      attribute :latitude,  ::String
      attribute :longitude, ::String
      attribute :range,     ::Float
      attribute :filters,   ::Hash

      attribute :data,      ::Car, lazy: true, default: :filtered_collection

      validates_presence_of :latitude, :longitude, :range

      def call
        return unless valid?
        data
      end

      private

      attribute :default_scope_collection, Object, lazy: true, default: :fetch_default_scope_collection
      attribute :scope_filters,            Array,  lazy: true, default: :collect_scope_filters
      attribute :filtered_collection,      Object, lazy: true, default: :fetch_filtered_collection

      def fetch_default_scope_collection
        Car.where(nil)
      end

      def fetch_filtered_collection
        scope_filters.reduce(default_scope_collection, :merge)
      end

      def collect_scope_filters
        [near_scope, price_scope].compact
      end

      def price_scope(scope_used: filters['price'])
        return if filters['price'].nil?
        -> { where(daily_price: scope_used) }
      end

      def near_scope
        Car.near([latitude, longitude], range)
      end
    end
  end
end
