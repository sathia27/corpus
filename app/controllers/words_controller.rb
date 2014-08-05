class WordsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def random
    random_number = rand(Word.untagged.count)
    @words = Word.untagged.limit(50).offset(random_number).all
    @word_search = Word.new
    @tags = Tag.pluck(:name, :id)
    respond_to do |format|
      format.html { render action: 'random' }
    end
  end

  def saveall
    word_list = params[:word_list][:word_list].values
    tagged_word_list = word_list.select { |word| !word[:tag_id].blank? }
    tagged_word_list.each do |word|
      w = Word.find(word[:word_id])
      puts w.update_attributes({:tag_id => word[:tag_id].to_i, :tag_created_by => current_user.id})
    end
    redirect_to root_path, :notice => "You have successfully tagged #{tagged_word_list.count} words"
  end

  def show
    @word = Word.find(params[:id])
    @tags = Tag.pluck(:id, :name)
    @word_search = Word.new

    respond_to do |format|
      format.html { render action: 'random' }
    end
  end

  def search_name
    @word = Word.where(name: params[:word][:name]).last
    if @word
      redirect_to word_path(@word)
    else
      redirect_to root_path, :notice => "Could not find ''#{params[:word][:name]}'"
    end
  end

  def index
    @words = Word.includes(:tag, :tagged_user).tagged.page(params[:page]).per(15)
    respond_to do |format|
      if params[:search]
        search = Word.untagged.where("name LIKE '%#{params[:term]}%'").collect{ |word| {id: word.id, label: word.name, value: word.name} }
        format.json { render :json => search.to_json }
      else
        format.json { render :json => @words.to_json }
      end
      format.html { render action: 'index' }
    end
  end

  def update
    @word = Word.find(params[:id])
    @tags = Tag.pluck(:id, :name)
    @word_search = Word.new
    return render action: 'random' if params[:word].blank? or params[:word][:tag_id].blank?
    params[:word][:tag_created_by] = current_user.id
    @word.update_attributes(params[:word].permit(:tag_id, :tag_created_by))
    redirect_to root_path
  end

  def review
    random_number = rand(Word.tagged.count)
    @word = Word.includes(:tagged_user).tagged.limit(1).offset(random_number).first
    @tags = Tag.pluck(:id, :name)
    respond_to do |format|
      format.html { render action: 'review' }
    end
  end
end
