class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :words,
      reject_if: proc {|attribute| attribute[:content].blank? }, allow_destroy: true
end
