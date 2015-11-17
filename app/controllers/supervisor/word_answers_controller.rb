class Supervisor::WordAnswersController < ApplicationController
  def index
    @word_answers = WordAnswer.paginate page: params[:page]
  end
  def new
    @word_answer = WordAnswer.new
    @words = Word.all
  end
  def show
  end
  def create
    @word_answer = WordAnswer.new word_answer_params
    if @word_answer.save
      flash[:success] = t :word_answer_created
      redirect_to root_path
    else
      render :new
    end
  end
  def update
  end
  def destroy
    @word_answer = WordAnswer.find params[:id]
    @word_answer.destroy
    flash[:success] = t :word_answer_deleted
    redirect_to request.referrer || root_url
  end
  private
  def word_answer_params
    params.require(:word_answer).permit :content, :correct, :word_id
  end
end
