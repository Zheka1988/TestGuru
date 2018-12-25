class QuestionsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_question, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_question_not_found


  def show; end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def resque_question_not_found
    render plain: "Question was not found"
  end


end
