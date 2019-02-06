class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    if successful_test?
      Badge.all.each do |badge|
        send badge.rule, badge
      end
    end
  end

  private

  def reward(badge)
    @user.badges << badge
  end

  def successful_test?
    @test_passage.successfully?
  end

  # за прохождение всех тестов определенной категории

  def category_complete(badge)
    if category_exist?(badge)
      cat_id = Category.find_by(title: badge.parametr).id
      tests_exist(badge, cat_id)
    end
  end

  def category_exist?(badge)
    Category.find_by(title: badge.parametr)
  end

  def tests_exist(badge, cat_id)
    if tests_exist?(cat_id)
      reward(badge) if all_tests_passed?(cat_id)
    end
  end

  def tests_exist?(cat_id)
    Test.find_by(category_id: cat_id)
  end

  def all_tests_passed?(cat_id)
    title_exist_test = []
    Test.where(category_id: cat_id).each {|test| title_exist_test << test.title}

    title_passed_test = []
    @user.tests.where(category_id: cat_id).each {|test| title_passed_test << test.title}
    title_passed_test.uniq!

    (title_exist_test - title_passed_test).empty?
    #title_exist_test.compare(title_passed_test) - почему то выходила ошибка
  end

  # за прохождение теста с первой попытки
  def first_try(badge)
    reward(badge) if @user.tests.where(id: @test.id).count == 1
  end

  # за прохождение всех тестов определенного уровня
  def level_complete(badge)
    if Test.find_by(level: badge.parametr.to_i)
      reward(badge) if all_tests_on_level?(badge)
    end
  end

  def all_tests_on_level?(badge)
    title_exist_test = []
    Test.where(level: badge.parametr.to_i).each {|test| title_exist_test << test.title}

    title_passed_test = []
    @user.tests.where(level: badge.parametr.to_i).each {|test| title_passed_test << test.title}
    title_passed_test.uniq!

    (title_exist_test - title_passed_test).empty?
  end
end
