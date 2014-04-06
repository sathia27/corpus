class WordsController < ApplicationController
  def random
    @word = Word.limit(1).order("RAND()").first
    respond_to do |format|
      format.html { render action: 'random' }
    end
  end
end
