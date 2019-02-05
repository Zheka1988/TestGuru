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
  #has_many :own_tests, class_name: "Test", dependent: :nullify
  has_many :feedbacks
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

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

  def username
    if full_name.blank?
      self.email.split('@')[0]
    else
      self.full_name
    end
  end

end
