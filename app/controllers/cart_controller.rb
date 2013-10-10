class CartController < ApplicationController
  include ApplicationHelper
  before_action :set_cart

  # GET /carts
  # GET /carts.json
  def index
    render 'show'
  end

  def all
    @carts = Cart.all
  end

  def delete
    @cart.cart_items.first(:conditions => [ "product_id = ?", params[:product_id]]).delete
    redirect_to cart_path
  end

  def add
    @cart.cart_items.create(product_id: params[:product_id], quantity: params[:quantity])
    redirect_to cart_path
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = get_current_cart
    end
end
