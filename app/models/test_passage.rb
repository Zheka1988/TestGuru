class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  @number_question = 0

  def completed?
    current_question.nil?
  end

  def finish_test
    if total_questions_count == correct_answers.count
      "test passed successfully"
    end
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.current_question = next_question
    save!
  end

  def result
    100 * self.correct_questions / test.questions.count
  end

  def passed?
    result >= 85
  end

  def total_questions_count
    test.questions.count
  end

  def number_current_question
    total_questions_count - remaining_questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
    #correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

end
