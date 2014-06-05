class Game < ActiveRecord::Base
	before_save :titleize_name
	before_save :prepend_link

	validates :name, presence: true, uniqueness: { case_sensitive: false }


	private

		def titleize_name
			self.name = self.name.downcase.titleize
		end

		def prepend_link
			if !self.website.nil? && self.website !~ /http:\/\/\S+/
				self.website = 'http://' + self.website
			end
		end
end
