module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
=begin    if test.level > 10
      'hard'
    elsif test.level > 0
      'midlle'
    else
      'elementary'
    end
=end
  end
end
