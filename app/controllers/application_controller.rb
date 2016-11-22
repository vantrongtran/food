class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :create_cart
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :chatwork_id, :avatar]
  end
  def create_cart
    @cart = Cart.build_cart session[:cart]
  end
end
