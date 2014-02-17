class Meeting < ActiveRecord::Base
  validates :name, :start_time, :end_time, :event_id, :location_id, presence: true
  validate :dates_are_reasonable
  belongs_to :location
  belongs_to :event

  def dates_are_reasonable
    errors.add(:start_time, 'must be before end time') if start_time >= end_time
  end
end
