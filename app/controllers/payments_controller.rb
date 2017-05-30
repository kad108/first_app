class PaymentsController < ApplicationController

	def create
		token = params[:stripeToken]
		@product = Product.find(params[:product_id])
		@user = current_user

		# Create the charge on Stripe's servers to charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: (@product.price*100), currency: "usd", source: token, description: params[:stripeEmail]
			)

		if charge.paid
			Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
		end

		rescue Stripe::CardError => e
			# The card has benn declined
		end
	redirect_to product_path(@product), notice: 'Thank you for your order!'
	end

end
