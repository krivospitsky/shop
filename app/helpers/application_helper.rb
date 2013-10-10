module ApplicationHelper
	def get_current_cart
		@cart = Cart.find_or_create_by_id(session[:cart_id])
		session[:cart_id]=@cart.id
		@cart
  	end
end
