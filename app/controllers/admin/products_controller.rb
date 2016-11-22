class Admin::ProductsController < ApplicationController

  before_action :load_product, only: [:destroy, :edit, :update]

  layout "admin_layout"
  def index
    @product = Product.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: ProductDatatable.new(view_context) }
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "create_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "create_failed"
      redirect_to admin_products_path
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "update_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "delete_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "delete_failed"
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :category_id,
      :price, :quanty, :image, :description
  end

  def load_product
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = t "product_not_found"
    end
  end
end
