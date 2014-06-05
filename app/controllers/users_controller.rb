class UsersController < ApplicationController
	before_action :signed_in_user, only: [:show, :edit]
	before_action :correct_user,   only: [:edit]
	before_action :admin_user,     only: :destroy
	before_action :new_user,       only: [:new, :create]

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to The Board Room"
			redirect_to @user
		else
			render 'new'
		end
	end

	def index
		@users = User.all
	end


	private

		def user_params
			params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
		end

		# Before filters
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end

		def new_user
			redirect_to root_url if signed_in?
		end
	
end
