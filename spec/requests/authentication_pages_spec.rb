require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "sign in page" do
	    before { visit signin_path }

	    it { should have_content('Sign in') }
	    it { should have_title('Sign in') }
	    it { should_not have_link('Profile') }
	end

	describe "signin" do
	    before { visit signin_path }

	    describe "with invalid information" do
	        before { click_button "Sign in" }

	        it { should have_title('Sign in') }
	        it { should have_selector('div.alert.bg-danger') }
	        it { should_not have_link('Profile') }
	        it { should_not have_link('Sign out') }

	        describe "after visiting another page" do
	            before { click_link "Home" }

	            it { should_not have_selector('div.alert.bg-danger') }
	        end
	    end

	    describe "with valid information" do
	        let(:user) { FactoryGirl.create(:user) }
	        before { sign_in user }

	        it { should have_title(user.name) }
	        it { should have_link('Profile',     href: user_path(user)) }
	        it { should have_link('Sign out',    href: signout_path) }
	        it { should_not have_link('Sign in', href: signin_path) }

	        describe "followed by signout" do
	            before { click_link "Sign out" }

	            it { should have_link('Sign in') }
	            it { should_not have_link('Profile') }
	        end
	    end
	end

	describe "authorization" do
	    
		describe "for non-signed in users" do
		    let(:user) { FactoryGirl.create(:user) }

		    describe "when attempting to visit a protected page" do
	    	    before do
	    	    	visit user_path(user)
	    	    	sign_in user
	    	    end

	    	    describe "after signing in" do

	    	        it "should render the desired protected page" do
	    	        	expect(page).to have_title(user.name)
	    	        end

	    	        describe "when signing in again" do
	    	            before do
	    	            	click_link "Sign out"
	    	            	visit signin_path
	    	            	sign_in user
	    	            end

	    	            it "should render the default, profile, page" do
	    	            	expect(page).to have_title(user.name)
	    	            end
	    	        end
	    	    end
	    	end

		    describe "in the Users controller" do

		    	describe "visiting the profile page" do
		    	    before { visit user_path(user) }

		    	    it { should have_title('Sign in') }
		    	end

		    end
		end

		describe "as wrong user" do
		    let(:user) { FactoryGirl.create(:user) }
		    let(:wrong_user) { FactoryGirl.create(:user, name: "Wrongway Dave", email: "wrong@example.com", username: "wrong") }
		    before { sign_in user, no_capybara: true }

		    describe "submitting a GET request to the Users#show action" do
		        before { get user_path(wrong_user) }
		        specify { expect(response.body).to match(full_title(wrong_user.name)) }
		    end
		end

		describe "as non-admin user" do
		    let(:non_admin) { FactoryGirl.create(:user) }

		    before { sign_in non_admin, no_capybara: true }

		    describe "submitting a request to the Games#new action" do
		        before { get add_game_path }
		        specify { expect(response).to redirect_to(root_url) }
		    end
		end

		# describe "as admin user" do
		#     let(:admin) { FactoryGirl.create(:user, admin: true) }
		#     before { sign_in admin, no_capybara: true }

		#     describe "should be able to create a new game in the database" do
		#     	before { post games_path }
		#     	it { should have_title('New Game') }
		#     end
		# end

	end

end
