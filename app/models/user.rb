class User < ApplicationRecord
  has_many :public, class_name: "Test", dependent: :nullify
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  scope :test_by_level, -> { where(level: level)}


  validates :name, presence: true
  validates :email, presence: true

end
