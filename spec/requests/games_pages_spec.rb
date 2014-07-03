require 'spec_helper'

describe "Games pages" do

	let(:user) { FactoryGirl.create(:user, admin: true) }
	let(:submit) { "Submit" }
	subject { page }

	describe "Add new game page" do
	    before do
	    	sign_in user
	    	visit add_game_path
	    end

	    it { should have_content('Add a new game') }
	    it { should have_title('New Game') }

	    describe "with invalid information" do
	        it "should not create a new game" do
	        	expect { click_button submit }.not_to change(Game, :count)
	        end

	        describe "after submission" do
	            before { click_button submit }

	            it { should have_title ('New Game') }
	            it { should have_content('error') }
	        end
	    end

	    describe "with valid information" do
	        before do
	        	fill_in "Name", with: "Example Game"
	        	fill_in "Website", with: "www.example.com"
	        end

	        it "should create a new game" do
	        	expect { click_button submit }.to change(Game, :count).by(1)
	        end
	    end
	end

	describe "Game show page" do
	    let!(:game) { FactoryGirl.create(:game) }
	    before { visit game_path(game) }

	    it { should have_content(game.name) }
	    it { should have_title(game.name) }
	end
end
