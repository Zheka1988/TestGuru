class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :traveled_tests

  scope :by_category, ->(title) { joins(:category)
                                  .where(categories: { title: title })
                                  .order(title: :desc)
                                }
  def self.with_category(title)
    by_category(title).pluck(:title)
  end
end
