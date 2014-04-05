class Admin::WordDocumentsController <  Admin::BaseController

  def index
    @word_documents = WordDocument.all
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @word_documents.to_json }
    end
  end

  def new
    @word_document = WordDocument.new
    render "new"
  end

  def create
    @word_document = WordDocument.new(params[:word_document].permit(:user_id, :word_list_file))
    respond_to do |format|
      if @word_document.save
        format.html { redirect_to admin_word_documents_path, notice: 'Document was successfully created' }
        format.json { head :no_content, json: @word_document.to_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @word_documents.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @word_document = WordDocument.find(params[:id])
    puts params[:word_document].inspect
    unless @word_document.update_attributes(word_document_update)
      flash[:error] = "Could not make process"
    end
    redirect_to admin_word_documents_path
  end

  def destroy
    @word_document = WordDocument.find(params[:id])
    @word_document.destroy
    redirect_to admin_word_documents_path
  end

  def show
  end

  def word_document_update
    params.require(:word_document).permit(:user_id, :word_list_file, :processed)
  end
end
