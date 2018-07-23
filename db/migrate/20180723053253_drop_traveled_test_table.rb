class DropTraveledTestTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :traveled_tests
  end
end
