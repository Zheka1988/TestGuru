class Answer < ApplicationRecord
  belongs_to :question

  scope :by_correct, ->(id) { where(question_id: id, correct: true) }
  validates :body, presence: true
  validate :validate_count_answer

  private
  def validate_count_answer
    errors.add(:question_id) if where(question_id: Question.ids).length == 4
  end
end
