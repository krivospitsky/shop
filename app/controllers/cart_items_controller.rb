class CartItemsController < ApplicationController
  def create
    @cart_item = @cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to  @cart
    end
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end
end
