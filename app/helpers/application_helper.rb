module ApplicationHelper

	# Returns the page title on a per page basis.
	def full_title(name)
		base_title = "The Board Room"
		if name.empty?
			base_title
		else
			"#{base_title} | #{name}"
		end
	end
end
