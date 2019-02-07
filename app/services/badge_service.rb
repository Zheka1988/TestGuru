class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return [] unless @test_passage.successfully?
    Badge.all.select do |badge|
      send badge.rule, badge
    end
  end

  private

  # def successful_test?
  #   @test_passage.successfully?
  # end

  # за прохождение всех тестов определенной категории

  def category_complete(badge)
    category = Category.find_by(title: badge.parametr)
    if category
      cat_id = Category.find_by(title: badge.parametr).id
      tests_exist(badge, cat_id)
    end
  end


  def tests_exist(badge, cat_id)
    test = Test.find_by(category_id: cat_id)
    if test
      badge if all_tests_passed?(cat_id)
    end
  end

  def all_tests_passed?(cat_id)
    Test.where(category_id: cat_id).count == @user.tests.where(category_id: cat_id).distinct.count
  end
# --------------------------------------------------------------


  # за прохождение теста с первой попытки
  def first_try(badge)
    badge if @user.tests.where(id: @test.id).count == 1
  end

  # за прохождение всех тестов определенного уровня
  def level_complete(badge)
    if Test.find_by(level: badge.parametr.to_i)
      badge if all_tests_on_level?(badge)
    end
  end

  def all_tests_on_level?(badge)
    Test.where(level: badge.parametr.to_i).count ==@user.tests.where(level: badge.parametr.to_i).distinct.count
  end
end
