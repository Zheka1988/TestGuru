module ApplicationHelper
  def current_year
    render plain: " #{Time.current.year} year"
  end

  def github_url(author, repo)
    render plain: "https://github.com/#{author}/#{repo}"
  end
end
