class Admin::TagsController < Admin::BaseController
  def index
    @tags = Tag.page(params[:page]).per(7)
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @tags.to_json }
    end
  end

  def new
    @tag = Tag.new
    render "new"
  end

  def create
    @tag = Tag.new(params[:tag].permit(:name))
    respond_to do |format|
      if @tag.save
        format.html { redirect_to admin_tags_path, notice: 'Tag was successfully created' }
        format.json { head :no_content, json: @tag.to_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end

end
