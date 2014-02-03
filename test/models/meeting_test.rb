require 'test_helper'

class MeetingTest < ActiveSupport::TestCase

  test "meeting is not valid if start time is greater than end time" do
    meeting = meetings(:backwards_times)
    assert meeting.invalid?
    assert_equal ["must be before end"], meeting.errors[:start]
  end

  test "meeting is not valid if start time is equal to end time" do
    meeting = meetings(:same_times)
    assert meeting.invalid?
    assert_equal ["must be before end"], meeting.errors[:start]
  end

end
