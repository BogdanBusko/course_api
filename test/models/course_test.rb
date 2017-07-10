require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'add new record' do
    Course.create(name: 'Programing')

    assert_equal 1, Course.count
  end
end
