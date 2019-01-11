class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :type, default: 'User', null: false,  index: true
      t.string :first_name
      t.string :last_name
    end
  end
end
