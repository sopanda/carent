# frozen_string_literal: true

module Bookings
  class DateValidator < ActiveModel::Validator
    def validate(record)
      record.errors.add(:start_date, "can't be in the past")     if record.start_date < Time.zone.today
      record.errors.add(:end_date, "can't be before start date") if record.end_date < record.start_date
    end
  end
end
