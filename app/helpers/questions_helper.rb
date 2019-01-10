module QuestionsHelper

  def question_header(resource)
    if resource.new_record?
      "Create New #{@test.title} Question"
    else
      "Edit #{resource.test.title} Question"
    end
#    debugger
  end
end
