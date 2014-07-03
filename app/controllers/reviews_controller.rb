class ReviewsController < ApplicationController
	# before_action :admin_user, only: [:new, :create, :destroy]

	def new
		@review = Review.new
	end

	def create
		@post = Review.new(review_params)
		if @post.save
			flash[:success] = "Review posted"
		else
			flash[:danger] = "Review failed to post, maybe you've already posted for this game...."
			@game = Game.find(params[:review][:game_id])
			@reviews = @game.reviews[0..-1]
			@post = @game.reviews.build
		end
		redirect_to Game.find(params[:review][:game_id])
	end

	def show
		@review = Review.find(params[:id])
	end

	def destroy
		destroyee = Review.find(params["id"]).destroy
		redirect_to destroyee.game
	end


	private

		def review_params
			params.require(:review).permit(:content, :game_id, :author_id)
		end

		# Before Filters
		
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end
