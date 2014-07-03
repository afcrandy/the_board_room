require 'spec_helper'

describe Review do

	let!(:user) { FactoryGirl.create(:user) }
	let!(:game) { FactoryGirl.create(:game) }

	before do
		@review = game.reviews.build(author_id: user.id,
			content: "Lorem ipsum dolor sit amet")
	end

	subject { @review }

	it { should respond_to(:content) }
	it { should respond_to(:author_id) }
	it { should respond_to(:author) }
	it { should respond_to(:game_id) }
	it { should respond_to(:game) }
	its(:game) { should eq game }
	its(:author) { should eq user }

	it { should be_valid }

	describe "when author_id is not present" do
	    before { @review.author_id = nil }
	    it { should_not be_valid }
	end

	describe "with blank content" do
	    before { @review.content = " " }
	    it { should_not be_valid }
	end

	describe "with content that is too long" do
	    before { @review.content = "a" * 501 }
	    it { should_not be_valid }
	end

	describe "when user has already reviewed the same game" do
	    before do
	    	review_for_same_game = @review.dup
	    	review_for_same_game.content = @review.content.upcase
	    	review_for_same_game.save
	    end

	    it { should_not be_valid }
	end

end
