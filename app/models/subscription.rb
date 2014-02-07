class Subscription < ActiveRecord::Base
  belongs_to :event
  belongs_to :attendee
end
