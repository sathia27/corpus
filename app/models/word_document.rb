class WordDocument < ActiveRecord::Base
  mount_uploader :word_list_file, WordListFileUploader
  validates_presence_of :word_list_file

  after_save do
    WordParser.new(self).parse_and_save unless processed?
  end
end
