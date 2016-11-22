class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy, :edit, :update]

  layout "admin_layout"
  def index
    @category = Category.new
    respond_to do |format|
      format.html
      format.json { render json: CategoryDatatable.new(view_context) }
    end
  end

  def new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "create_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "create_failed"
      redirect_to admin_categories_path
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "update_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "delete_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "delete_failed"
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
  def load_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "category_not_found"
    end
  end
end
