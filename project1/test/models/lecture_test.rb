require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "should not save lecture without content" do
      lecture = Lecture.new
      assert_not lecture.save
      lecture.content = 'Test'
      assert_not lecture.save
    end



end
