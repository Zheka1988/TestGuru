module GistsHelper
  def hash_gists(gist)
    gist.url.split('/').last
  end
end
