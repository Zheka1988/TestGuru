class RemovePassedFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :passed, :boolean
  end
end
