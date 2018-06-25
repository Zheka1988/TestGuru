class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[5.2]
=begin
  def change
  end
=end
  def up
    change_column_null(:categories, :title, false)
  end

  def down
    change_column_null(:categories, :title, true)
  end
end
