class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_current_cart
  private

  def get_current_cart
    @cart = Cart.find_or_create_by_id(session[:cart_id])
    session[:cart_id]=@cart.id
  end
end
