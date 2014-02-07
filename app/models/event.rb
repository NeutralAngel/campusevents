class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true
  validate :dates_are_reasonable
  has_many :meetings
  has_many :subscriptions
  has_many :attendees, through: :subscriptions
  has_and_belongs_to_many :sponsors

  def dates_are_reasonable
    if start_date >= end_date
      errors.add(:start_date, "must be before End date")
    end
  end
end
