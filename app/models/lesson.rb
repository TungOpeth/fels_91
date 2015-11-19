class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  has_many :words , through: :lesson_words
  accepts_nested_attributes_for :lesson_words
  WORDS_IN_LESSON = 20
  before_create :add_words
  before_update :calculate_result
  private
  def add_words
    self.words = self.category.words.order("RANDOM()").limit WORDS_IN_LESSON
  end
  def calculate_result
    result = 0
    self.lesson_words.each do |lesson_word|
     if lesson_word.word_answer_id == nil
     else
       if self.words.find(lesson_word.word_id).word_answers.find(lesson_word.word_answer_id).correct == true
       result += 1
       else
       end
     end
    end
    self.result = result
  end
end
