class CartController < ApplicationController
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
end
