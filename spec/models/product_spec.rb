require 'rails_helper'

describe Product do

	before do
		@product = Product.create!(name: "No Cat", description: "there is no any cat here")
		@user = User.create!(email: "test-user@mail.com", password: "test-password")
		@product.comments.create!(rating: 1, user: @user, body: "nothing special")
		@product.comments.create!(rating: 3, user: @user, body: "neither good nor bad")
		@product.comments.create!(rating: 5, user: @user, body: "lovely one!")
	end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3
	end

end