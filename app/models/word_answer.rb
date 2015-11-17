class WordAnswer < ActiveRecord::Base
  belongs_to :word
  TRUE = "true"
  FALSE = "false"
end
