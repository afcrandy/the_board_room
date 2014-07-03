require 'spec_helper'

describe "Reviews pages" do
	# subject { page }

	# let(:non_admin) { FactoryGirl.create(:user, email: "bob@example.com", username: "bobski") }
	# let(:admin) { FactoryGirl.create(:user, admin: true) }
	# let(:game) { FactoryGirl.create(:game) }

	# describe "review posting" do

	#     describe "with non-admin user" do
	#     	before do 
	# 	    	sign_in non_admin, no_capybara: true
	# 	    	visit game_path(game)
	# 	    end
	#         it { should_not have_selector('textarea') }

	#         describe "submitting to the Reviews#create action" do
	#         	let(:number) { Review.count }
	#         	let(:params) do
	#         		{ review: { author_id: non_admin.id, game_id: game.id, content: "This is a review" } }
	#         	end
	#             before { post reviews_path, params }
	#             it "should not work" do
	#             	expect(Review.count).to eq number
	#             end
	#         end
	#     end

	#     describe "with admin user" do
	#     	before do 
	#     		sign_in admin, no_capybara: true
	#     		visit game_path(game)
	#     	end
	#         it { should have_selector('textarea') }

	#         describe "submitting to the Reviews#create action" do
	#             let(:admin_params) do
	#         		{ review: { author_id: admin.id, game_id: game.id, content: "This is a review" } }
	#         	end
	#         	it "should create a Review" do
	#         		expect do
	# 	        	    post reviews_path, admin_params
	# 	        	end.to change(Review, :count).by(1)
	# 	        end
	#         end
	#     end
	# end
end
