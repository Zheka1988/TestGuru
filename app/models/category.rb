class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
  scope :all_categories, -> { order(created_at: :asc) }

  validates :title, presence: true
end
