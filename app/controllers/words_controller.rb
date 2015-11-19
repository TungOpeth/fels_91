class WordsController < ApplicationController
  def index
    @words = Word.paginate page: params[:page]
  end

end
