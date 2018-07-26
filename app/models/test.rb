class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users


  scope :by_category, ->(title) { joins(:category)
                                  .where(categories: { title: title })
                                  .order(title: :desc)
                                }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :compound, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: {only_integer: true}, uniqueness: true

  def self.with_category(title)
    by_category(title).pluck(:title)
  end
end
