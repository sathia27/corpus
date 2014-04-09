class WordsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def random
    @word = Word.where("tag_id is NULL").limit(1).order("RAND()").first
    @tags = Tag.all
    respond_to do |format|
      format.html { render action: 'random' }
    end
  end

  def index
    @words = Word.where("tag_id is NOT NULL").page(params[:page]).per(15)
    respond_to do |format|
      format.json { render :json => @words.to_json }
      format.html { render action: 'index' }
    end
  end

  def update
    @word = Word.find(params[:id])
    @tags = Tag.all
    return render action: 'random' if params[:word].blank? or params[:word][:tag_id].blank?
    params[:word][:tag_created_by] = current_user.id
    @word.update_attributes(params[:word].permit(:tag_id, :tag_created_by))
    redirect_to :back
  end

  def review
    @word = Word.where("tag_id is NOT NULL").limit(1).order("RAND()").first
    @tags = Tag.all
    respond_to do |format|
      format.html { render action: 'review' }
    end
  end
end
