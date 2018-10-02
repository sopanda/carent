class BookingValidator < ActiveModel::Validator
  def validate(record)
    if record.start_date.present? && record.start_date < Date.today
      record.errors.add(:start_date, "start date can't be in the past")
    end
  
    if record.end_date.present? && record.end_date < record.start_date
      record.errors.add(:end_date, "end date can't be before start date")
    end
  end
end
