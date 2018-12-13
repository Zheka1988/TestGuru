class DropTableTestsUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :tests_users, if_exists: true
    remove_column :users, :password
    add_column :users, :password_digest, :string
  end
end
