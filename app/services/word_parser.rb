class WordParser
  def initialize word_document
    @word_document = word_document
  end


  def parse_and_save
    words = File.open(Rails.root.to_s + "/public" +  @word_document.word_list_file.url).readlines
    words.each do |word|
      puts Word.create(name: word.strip, user_id: @word_document.user_id)
    end
    @word_document.update_attributes(:processed => true)
  end
end
