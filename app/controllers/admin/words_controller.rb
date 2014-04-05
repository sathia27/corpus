class Admin::WordsController < Admin::BaseController
  def index
    render :json => true
  end
end
