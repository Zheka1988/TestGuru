class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :resque_question_not_found

  def index
    render plain: @test.questions.pluck(:body, :id)
  end

  def show
    @question = @test.questions.find(params[:id])
    render plain: @question.body
  end

  def new

  end

  def create
    @question = @test.questions.create(question_params)
    render plain: "Question was created"
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    render plain: "Question was deleted"
  end


  private
  def question_params
    params.require(:question).permit(:body)
  end


  def find_test
    @test = Test.find(params[:test_id])
  end

  def resque_question_not_found
    render plain: "Question was not found"
  end

end
