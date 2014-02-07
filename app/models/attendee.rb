class Attendee < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  has_many :subscriptions
  has_many :events, through: :subscriptions
end
