class Award
  RULE = { "category_complete" => :category_complete, "first_try" => :first_try, "level_complete" => :level_complete }
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      send RULE[badge.rule], badge if successful_test?
      # case badge.rule
      # when 'category_complete'
      #   reward(badge) if category_complete?(badge.parametr)
      # when 'first_try'
      #   reward(badge) if first_try?
      # when 'level_complete'
      #   reward(badge) if level_complete?(badge.parametr.to_i)
      # end
    end
  end
# -----------------------RULE--------------------
  def category_complete(badge)
    reward(badge) if category_complete?(badge.parametr)
  end

  def first_try(badge)
    reward(badge) if first_try?
  end

  def level_complete(badge)
    reward(badge) if level_complete?(badge.parametr.to_i)
  end
#------------------------------------------------


  private

  def reward(badge)
    @user.badges << badge
  end

  def successful_test?
    @test_passage.successfully?
  end

  # за прохождение всех тестов определенной категории

  def category_complete?(category)
    cat_id = Category.find_by(title: category).id
    Test.where(category_id: cat_id).count == @user.tests.where(category_id: cat_id).count
  end

  # за прохождение теста с первой попытки

  def first_try?
    @user.tests.where(id: @test.id).count == 1
  end

  # за прохождение всех тестов определенного уровня

  def level_complete?(level)
    Test.where(level: level).count ==  @user.tests.where(level: level).count
  end
end
