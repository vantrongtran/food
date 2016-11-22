class Admin::SuggestsController < ApplicationController
  before_action :load_product, only: [:destroy, :update]

  layout "admin_layout"
  def index
    @product = Product.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: SuggestDatatable.new(view_context) }
    end
  end

  def update
    if @product.update_columns(types: 0)
      flash[:success] = t "saved"
      redirect_to admin_suggests_path
    else
      redirect_to admin_suggests_path
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

  def load_product
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = t "product_not_found"
    end
  end
end
