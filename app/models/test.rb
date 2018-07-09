class Test < ApplicationRecord
#  belongs_to :category_id
  def self.sort_test(category)
    Test.order('id DESC').where('category_id == ?', category)
  end
end
