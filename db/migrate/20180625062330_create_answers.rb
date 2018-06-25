class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :id_test
      t.integer :id_question

      t.timestamps
    end
  end
end
