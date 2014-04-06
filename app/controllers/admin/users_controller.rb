class Admin::UsersController < Admin::BaseController
  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(7)
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @users.to_json }
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.update_attributes(user_update)
      flash[:error] = "Could not make process"
    end
    redirect_to admin_users_path
  end

  def user_update
    params.require(:user).permit(:admin)
  end

end
