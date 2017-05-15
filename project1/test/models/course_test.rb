require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save new course without title" do
    course = Course.new
    assert_not course.save
    course.title = 'Test cousre'
    assert_not course.save
  end

end
