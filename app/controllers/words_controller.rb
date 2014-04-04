class WordsController < ApplicationController
  def index
    render :json => Word.all.to_json
  end
end
