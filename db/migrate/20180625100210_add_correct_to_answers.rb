class AddCorrectToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct, :string
  end
end
