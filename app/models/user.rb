class User < ApplicationRecord
  has_many :public, class_name: "Test", dependent: :nullify
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  validates :name, :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end
