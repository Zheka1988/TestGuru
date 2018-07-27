class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(created_at: :asc) }

  validates :title, presence: true
end
