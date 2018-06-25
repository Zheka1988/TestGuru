class AddTestsLevelDefault < ActiveRecord::Migration[5.2]
=begin
  def change
  end
=end
  def up
    change_column :tests, :level, :integer, default: 1
  end

  def down
    change_column :tests, :level, :integer, default: nil
  end
end
