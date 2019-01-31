class AddTestsTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :password, false)
    change_column_null(:categories, :title, false)
    change_column_null(:tests, :title, false)
  end
end
