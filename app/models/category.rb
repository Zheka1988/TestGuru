class Category < ApplicationRecord
  default_scope { order(created_at: :asc) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true
end
