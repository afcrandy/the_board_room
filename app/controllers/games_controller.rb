class GamesController < ApplicationController
	before_action :admin_user, only: [:new, :create, :update]

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			flash[:success] = "New game, '#{@game.name}', added to the database."
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
		@reviews = @game.reviews[0..-1]
		@post = Review.new
	end

	def index
		@games = Game.all
	end


	private

		def game_params
			params.require(:game).permit(:name, :website, :genre)
		end

		# Before filters

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end
