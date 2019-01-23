module GistsHelper
  def get_hash_gists(gist)
    array_reference_elements = gist.url.split('/')
    hash = array_reference_elements[3]
  end
end
