class User < ApplicationRecord
  def list_test(level)
    Test.where("level = ? AND passed = ?", level, :true)
  end
end
