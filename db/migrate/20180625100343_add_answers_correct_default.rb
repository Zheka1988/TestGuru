class AddAnswersCorrectDefault < ActiveRecord::Migration[5.2]
=begin
  def change
  end
=end
  def up
    change_column :answers, :correct, :string, default: 'NO'
  end

  def down
    change_column :answers, :correct, :string, default: nil
  end
end
