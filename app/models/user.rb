class User < ApplicationRecord
  def test_by_level(level)
    tests_id = self.tests_travelled.split(',')
    tests = []
    tests_id.each { |id| tests << Test.where('id = ? AND level = ?', id.to_i, level) }
    tests
  end
end
