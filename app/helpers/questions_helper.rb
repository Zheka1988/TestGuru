module QuestionsHelper

  def question_header
    params[:action] == 'new' ? @test.title : Test.find(@question.test_id).title
  end

=begin
  def shallow_args(parent, child)
    params[:action] == 'new' ? [parent, child] : child
  end
=end

end
