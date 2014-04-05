class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin
  layout "admin"
  def authenticate_admin
    #redirect_to words_path
  end
end
