require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'callback before_create' do
    assert_equal 'До початку курсу залишилось: 4 д.', Course.first.status
  end

  test 'callback before_update' do
    Course.last.update_attribute(:start_date, DateTime.now + 3)

    assert_equal 'До початку курсу залишилось: 2 д.', Course.last.status
  end
end
