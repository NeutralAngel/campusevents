class Location < ActiveRecord::Base
  validates :name, presence: true
  has_many :meetings

  def upcoming_meetings
    future_meetings.sort{|a,b| a.start_time <=> b.start_time}.first(5)
  end

  def future_meetings
    meetings.where(['start_time > ?', DateTime.now])
  end
end
