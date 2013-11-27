class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]
  def create
    if item=@current_cart.cart_items.find_by(product_id: params[:cart_item][:product_id])
      item.quantity+=params[:cart_item][:quantity].to_i
      item.save
      redirect_to  @current_cart
    else
      @cart_item = @current_cart.cart_items.new(cart_item_params)
      if @cart_item.save
        redirect_to  @current_cart
      end
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @current_cart, notice: 'Product was successfully updated.'
    else
      redirect_to @current_cart, error: 'Some error.'
    end
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to @current_cart }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

end
