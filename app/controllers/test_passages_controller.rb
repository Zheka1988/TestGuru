class TestPassagesController < ApplicationController

  before_action :authenticate_user!

  before_action  :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.html_url.present?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
       flash.notice = t('.success', url: result.html_url)
    else
       flash.alert = t('.failure')
    end

    redirect_to @test_passage
  end

  def update
    if @test_passage.time_over?
      complete_test
    else
      next_action
    end
  end

  private

  def complete_test
    @test_passage.current_question = nil
    send_mail
    redirect_to result_test_passage_path(@test_passage)
  end

  def next_action
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      send_mail
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def send_mail
    TestsMailer.completed_test(@test_passage).deliver_now
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
