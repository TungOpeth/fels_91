class LessonsController < ApplicationController
  before_action :load_category, only: [:create]
  before_action :load_lesson, only: [:show]
  def create
    @lesson = current_user.lessons.new category_id: @category.id
    if @lesson.save
      flash[:success] = t "create_lesson_complete"
      redirect_to @lesson
    else
      flash[:danger] = t "create_lesson_fail"
      redirect_to categories_path
    end
  end
  def update
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = "update_lesson_complete"
    else
      flash[:danger] = t "update_lesson_fail"
    end
    redirect_to @lesson
  end
  private
  def load_category
    @category = Category.find_by id: params[:lesson][:category_id]
    redirect_to categories_path unless @category
  end
  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    redirect_to categories_path unless @lesson
  end
  def lesson_params
    params.require(:lesson).permit lesson_words_attributes: [:id, :word_answer_id]
  end
end
