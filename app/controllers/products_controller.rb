class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.all.paginate page: params[:page],
      per_page: Settings.per_page
    if params[:categoryId]
      @products = Product.search_by_category(params[:categoryId]).paginate page: params[:page],per_page: Settings.per_page
    elsif params[:name]
      @products = Product.search_by_name(params[:name]).paginate page: params[:page],per_page: Settings.per_page
    end

  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "create_success"
      redirect_to suggests_path
    else
      flash[:danger] = t "create_failed"
      redirect_to suggests_path
    end
  end
  private
  def product_params
    params.require(:product).permit(:name, :category_id,
      :price, :quanty, :image, :description)
      .merge(user_id: current_user.id, types: 1)
  end

end
