require 'spec_helper'

describe "Static Pages" do
	describe "Home page" do
		it "should have content 'The Board-Room'" do
			visit root_path
			expect(page).to have_content('The Board-Room')
		end
	end
end
