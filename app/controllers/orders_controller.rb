class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: :show

  def index
    @orders = current_user.orders.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    if @cart.present?
      @order = Order.new order_params
      if @order.save
        UserMailer.order_mail(@order).deliver_now
        @cart.items.each do |item|
          @product = Product.find_by id: item.product_id
          if @product.quanty >= item.quantity
            @quantity = @product.quanty - item.quantity
            @product.update_columns(quanty: @quantity)
          else
            flash[:danger] = t "orders.failed"
            @order.destroy
          end
        end
        session.delete :cart
        flash[:success] = t "orders.successful"
        redirect_to order_path @order
      else
        flash[:danger] = t "orders.address"
        redirect_to :back
      end
    else
      flash[:danger] = t "orders.no_product"
      redirect_to carts_path
    end
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:address).merge! user: current_user,
      total: @cart.total_price, cart: @cart
  end

  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "orders.not_found"
      redirect_to root_path
    end
  end

end

