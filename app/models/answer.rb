class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_answer

  private
  def validate_count_answer
    errors.add(:question_id) if self.class.where(question_id: self.question_id).count >= 4
  end
end
