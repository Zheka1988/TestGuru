class AddUsersNameAndPasswordNullConstraint < ActiveRecord::Migration[5.2]
=begin
  def change
  end
=end
  def up
    change_column_null(:users, :name, false)
    change_column_null(:users, :password, false)
  end

  def down
    change_column_null(:users, :name, true)
    change_column_null(:users, :password, true)
  end
end
