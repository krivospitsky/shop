class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]



  # GET /products/1
  # GET /products/1.json
  def show
    @title=@product.name
    @cart_item = @cart.cart_items.new(product_id: @product.id, quantity:1)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :discount, :attrs, :options, :category_id, :sku, :count, :hidden, :sort, :vendor_id, :seo_name)
    end
end
