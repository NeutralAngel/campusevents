class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true
  validate :dates_are_reasonable
  has_many :meeting
  has_and_belongs_to_many :events

  def dates_are_reasonable
    if start_date >= end_date
      errors.add(:start_date, "must be before End date")
    end
  end

end
