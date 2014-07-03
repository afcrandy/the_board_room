module GamesHelper
	def game_image_tag(source=nil, options={})
		if source
			image_tag source, options
		else
			image_tag 'placeholder.jpg', alt: "No image", size: "50x50"
		end
	end
end
