class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  def self.by_category(category)
    category_list = []
    category_list << Category.where('title = ?', category)
    show_test = []
    category_list.each do |element|
      show_test << order('id DESC').where('category_id = ?', element.ids)
    end
    show_test
  end
end
