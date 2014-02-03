class Meeting < ActiveRecord::Base
  validates :name, :start, :end, presence: true
  validate :dates_are_reasonable

  def dates_are_reasonable
    if start >= self.end
      errors.add(:start, "must be before end")
    end
  end
   
end
