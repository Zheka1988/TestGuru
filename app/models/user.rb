class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def test_by_level(level)
    Test.joins(:tests_users).where(level: level, tests_users: { user_id: self.id})
  end
end
