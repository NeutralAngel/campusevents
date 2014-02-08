require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test "meeting is not valid if start time is greater than end time" do
    meeting = meetings(:backwards_times)
    assert meeting.invalid?
    assert_equal ["must be before end time"], meeting.errors[:start_time]
  end

  test "meeting is not valid if start time is equal to the end time" do
    meeting = meetings(:single_time)
    assert meeting.invalid?
    assert_equal ["must be before end time"], meeting.errors[:start_time]
  end
end
