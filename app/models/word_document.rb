class WordDocument < ActiveRecord::Base
  mount_uploader :word_list_file, WordListFileUploader
  validates_presence_of :word_list_file
end
