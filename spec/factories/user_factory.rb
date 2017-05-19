FactoryGirl.define do

	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email
		password "testpassword"
		first_name "Test"
		last_name "User"
		admin false
	end

end