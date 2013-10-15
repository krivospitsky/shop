class CartItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product


  def price_to_s
    number_to_currency(product.price)
  end

  def total_price_to_s

  end

end
