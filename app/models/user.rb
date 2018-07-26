class User < ApplicationRecord
  has_many :tests #dependent: :destroy - не добавляю т.к. пользователя
  # можно удалить, а тесты должны остаться
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def test_by_level(level)
    tests.where(level: level)
  end
end
