module QuestionsHelper
  def question_header
    @test.title
  end

  def shallow_args(parent, child)
    params[:action] == 'new' ? [parent, child] : child
  end

end
