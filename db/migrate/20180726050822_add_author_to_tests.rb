class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author  #, foreign_key: true
    add_foreign_key :articles, :authors
  end
end
