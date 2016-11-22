class Admin::DashboardController < ApplicationController

  layout "admin_layout"
  def index
    @new_orders = Order.waiting.size
    @new_suggests = Product.suggest.size
  end
end
