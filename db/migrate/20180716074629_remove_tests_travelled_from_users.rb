class RemoveTestsTravelledFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tests_travelled, :string
  end
end
