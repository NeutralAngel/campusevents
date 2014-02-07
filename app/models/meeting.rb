class Meeting < ActiveRecord::Base
  validates :name, :start_time, :end_time, presence: true
  validate :dates_are_reasonable
  belongs_to :location
  belongs_to :event

  def dates_are_reasonable
    if start_time >= end_time
      errors.add(:start_time, "must be before end time")
    end
  end
   
end
