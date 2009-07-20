require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerSchool < Test::Unit::TestCase

  def setup
    @tester = Faker::School
  end
  
  def test_course_code
    assert @tester.course_code.match(/^[0-9A-Z]+$/)
  end

  def test_subject_name
    assert @tester.subject_name.match(/[A-Z][a-z]+/)
  end

  def test_course_name
    assert @tester.course_name.match(/\w+ \w+/)
  end
end
