class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @products = Product.all.paginate page: params[:page],
      per_page: Settings.per_page
  end
end
