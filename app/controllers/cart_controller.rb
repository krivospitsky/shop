class CartController < ApplicationController
  before_filter :check_admin, except: [:show, :index]
  # GET /carts
  # GET /carts.json
  def index
    @order=Order.new(cart: @cart)
    render 'show'
  end

  def show
    @order=Order.new(cart: @cart)
  end

  def all
    @carts = Cart.all
  end
end
