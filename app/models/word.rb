class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers,
      reject_if: proc {|attribute| attribute[:content].blank? }, allow_destroy: true
end
