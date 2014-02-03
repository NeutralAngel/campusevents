require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "event is not valid if start date is greater than end date" do
    event = events(:backwards_dates)
    assert event.invalid?
    assert_equal ["must be before End date"], event.errors[:start_date]
  end

  test "event is not valid if start date is equal to the end date" do
    event = events(:single_date)
    assert event.invalid?
    assert_equal ["must be before End date"], event.errors[:start_date]
  end

end
