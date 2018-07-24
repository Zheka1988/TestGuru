class User < ApplicationRecord
  belongs_to :test
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def test_by_level(level)
    Test.where(level: level)
  end
end
