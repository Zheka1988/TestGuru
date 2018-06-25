class AddTestsTitleNullConstraint < ActiveRecord::Migration[5.2]
=begin
  def change
  end
=end

  def up
    change_column_null(:tests, :title, false)
  end

  def down
    change_column_null(:tests, :title, true)
  end
end
