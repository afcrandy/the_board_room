require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "sign in page" do
	    before { visit signin_path }

	    it { should have_content('Sign in') }
	    it { should have_title('Sign in') }
	    it { should_not have_link('Profile') }
	end

	describe "sign in" do
	    before { visit signin_path }

	    describe "with invalid information" do
	        before { click_button "Sign in" }

	        it { should have_title('Sign in') }
	        it { should have_selector('div.alert.alert-error') }
	        it { should_not have_link('Profile') }
	        it { should_not have_link('Sign out') }

	        describe "after visiting another page" do
	            before { click_link "Home" }

	            it { should_not have_selector('div.alert.alert-error') }
	        end
	    end

	    describe "with valid information" do
	        let(:user) { FactoryGirl.create(:user) }
	        before do
	        	visit signin_path
	        	valid_sign_in(user)
	        end

	        it { should have_title(user.name) }
	        it { should have_link('Profile',     href: user_path(user)) }
	        it { should have_link('Sign out',    href: signout_path) }
	        it { should_not have_link('Sign in', href: signin_path) }

	        describe "followed by sign out" do
	            before { click_link "Sign out" }

	            it { should have_link('Sign in') }
	            it { should_not have_link('Profile') }
	        end
	    end
	end

end
