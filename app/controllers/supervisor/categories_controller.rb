class Supervisor::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
  end
  def new
    @category = Category.new
  end
  def show
  end
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :category_created
      redirect_to root_path
    else
      render :new
    end
  end
  def update
  end
  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = t :category_deleted
    redirect_to request.referrer || root_url
  end
  private
  def category_params
    params.require(:category).permit :name,
    words_attributes: [:id, :content, :_destroy,
    word_answers_attributes: [:id, :content, :correct,:_destroy]]
  end
end
