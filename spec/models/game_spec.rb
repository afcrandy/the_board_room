require 'spec_helper'

describe Game do
	before do
		@game = Game.new(name: "Example Game", website: "www.example.com", genre_id: 3)
	end

	subject { @game }

	it { should respond_to(:name) }
	it { should respond_to(:website) }
	it { should respond_to(:genre_id) }
	it { should respond_to(:reviews) }

	it { should be_valid }

	describe "when name is not present" do
	    before { @game.name = " " }
	    it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
		    game_with_same_name = @game.dup
		    game_with_same_name.name = @game.name.upcase
		    game_with_same_name.save
		end

		it { should_not be_valid }
	end

	describe "name with mixed case" do
	    let(:mixed_case_name) { "eXaMpLe GaMe" }

	    it "should be saved properly capitalized" do
	    	@game.name = mixed_case_name
	    	@game.save
	    	expect(@game.reload.name).to eq mixed_case_name.downcase.titleize
	    end
	end

	describe "website not prepended correctly" do
	    let(:correct_hyperlink) { "http://www.example.com" }

	    it "should save with 'http://' prepended" do
	    	@game.save
	    	expect(@game.reload.website).to eq correct_hyperlink
	    end
	end
end
