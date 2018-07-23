class AddTestsTravelledToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tests_travelled, :string
  end
end
