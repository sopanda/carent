# frozen_string_literal: true

module Bookings
  class DateValidator < ActiveModel::Validator
    def validate(record)
      start_date = record.start_date
      end_date   = record.end_date

      return if [start_date, end_date].any?(&:nil?)

      record.errors.add(:start_date, "can't be in the past")     if start_date < Time.zone.today
      record.errors.add(:end_date, "can't be before start date") if end_date   < start_date
    end
  end
end
