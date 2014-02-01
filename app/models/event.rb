class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true
  validate :dates_are_reasonable

  def dates_are_reasonable
    if start_date > end_date
      errors.add(:start_date, "can't be after End date")
    end
  end

end
