#require 'digest/sha1'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  #include Auth
  #has_secure_password

  has_many :own_tests, class_name: "Test", dependent: :nullify

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  def tests_by_level(level)
    tests.where(level: level)
  end

  def admin?
    self.is_a?(Admin)
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
