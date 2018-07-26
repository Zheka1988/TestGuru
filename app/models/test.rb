class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users


  scope :by_category, ->(title) { joins(:category)
                                  .where(categories: { title: title })
                                  .order(title: :desc)
                                }
  def self.with_category(title)
    by_category(title).pluck(:title)
  end
end
