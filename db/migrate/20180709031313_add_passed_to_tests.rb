class AddPassedToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :passed, :boolean
  end
end
