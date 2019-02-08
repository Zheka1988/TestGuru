class AddTestResultToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :test_result, :boolean, default: false
  end
end
