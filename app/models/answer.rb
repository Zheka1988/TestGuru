class Answer < ApplicationRecord
  belongs_to :question

  scope :by_correct, ->(id) { where(question_id: id, correct: true) }
  validates :body, presence: true

end
