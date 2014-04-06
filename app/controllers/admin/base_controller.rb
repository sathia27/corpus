class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin
  layout "admin"
  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
