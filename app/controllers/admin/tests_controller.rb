class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]

  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @user  = @current_user
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)
    @test.author_id = current_user.id
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def resque_question_not_found
    render plain: "Question was not found"
  end

end
