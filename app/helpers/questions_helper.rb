module QuestionsHelper
  def question_header_edit
    render plain: "Edit #{@test.title} Question"
  end

  def question_header_create
    render plain: "Create New #{@test.title} Question"
  end

  def current_year
    render plain: " #{Time.current.year} year"
  end

  def github_url(author, repo)
    render plain: "https://github.com/#{author}/#{repo}"
  end
end
