class SuggestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.new
    @categories = Category.all
    @suggests =  current_user.products.paginate page: params[:page],
      per_page: Settings.per_page
  end
end
