class User < ApplicationRecord
  has_many :traveled_tests
  def test_by_level(level)
    tests = []
    tests << TraveledTest.where('user_id = ?', self.id)
    tests.each do |i|
      Test.where('id = ? AND level = ?', i.ids, level)
    end
  end
end
