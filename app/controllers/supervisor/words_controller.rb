class Supervisor::WordsController < ApplicationController
  def index
    @words = Word.paginate page: params[:page]
  end
  def new
    @word = Word.new
    @categories = Category.all
  end
  def show
  end
  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t :word_created
      redirect_to root_path
    else
      render :new
    end
  end
  def update
  end
  def destroy
    @word = Word.find params[:id]
    @word.destroy
    flash[:success] = t :word_deleted
    redirect_to request.referrer || root_url
  end
  private
  def word_params
    params.require(:word).permit :content, :category_id
  end
end
