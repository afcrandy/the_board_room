FactoryGirl.define do
	factory :user do
		name     "Andrew Reid"
		email    "randy@example.com"
		username "randyman"
		password "foobar"
		password_confirmation "foobar"
	end
end