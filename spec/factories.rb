FactoryGirl.define do
	factory :user do
		name     "Andrew Reid"
		email    "randy@example.com"
		username "randyman"
		password "foobar"
		password_confirmation "foobar"
	end

	factory :game do
		name     "Example game"
		website  "www.example.com"
		genre_id 2
	end
end