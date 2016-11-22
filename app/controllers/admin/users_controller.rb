class Admin::UsersController < ApplicationController

  before_action :load_user, only: [:destroy]

  layout "admin_layout"
  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end
  def destroy
    if @user.destroy
      flash[:success] = t "delete_success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "delete_failed"
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user_not_found"
    end
  end

end
