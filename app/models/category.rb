class Category < ApplicationRecord
  def self.look_table
    Category.select(:title)
=begin    cat = Category.where('title == ?','web')
    cat[1]
=end
  end
end
