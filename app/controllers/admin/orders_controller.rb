class Admin::OrdersController < ApplicationController
  layout "admin_layout"
  before_action :load_order, only: :update

  def index
    respond_to do |format|
      format.html
      format.json { render json: OrderDatatable.new(view_context) }
    end
  end

  def update
    if @order.waiting?
      if @order.update_columns(status: 1)
        flash[:success] = t "saved"
        redirect_to admin_orders_path
      else
        redirect_to admin_orders_path
      end
    else
      if @order.update_columns(status: 0)
        flash[:success] = t "saved"
        redirect_to admin_orders_path
      else
        redirect_to admin_orders_path
      end
    end
  end

  private
  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "product_not_exist"
      redirect_to admin_orders_path
    end
end
end
