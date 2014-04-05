class Admin::WordsController < Admin::BaseController
  def index
    @words = Word.all
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @words.to_json }
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to admin_words_path
  end
end
