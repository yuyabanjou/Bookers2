class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
 		@users = User.all
		# @users = User.order(id: :asc)
		@book_new = Book.new
		@user = current_user
	end

	def show
		@book_new = Book.new
		@user = User.find(params[:id])
		@books = @user.books.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
