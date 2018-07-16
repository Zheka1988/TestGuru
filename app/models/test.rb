class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :traveled_tests

  def self.by_category(category)
    category_list = []
    category_list << Category.where('title = ?', category)
    category_list.each do |element|
      order('id DESC').where('category_id = ?', element.ids).pluck(:title)
    end
  end
end
