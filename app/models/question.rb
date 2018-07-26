class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_count_answer

  private
  def validate_count_answer
    errors.add(Answer.question_id) if Answer.where(question_id: Question.ids).length >= 4
  end

end
