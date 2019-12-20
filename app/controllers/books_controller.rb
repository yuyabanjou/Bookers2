class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def show
    @book_new = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def create
  	@book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
  	 if @book_new.save
  	 	flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book_new)
  	 else
  		@books = Book.all
      @user = current_user
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
     if @book.user != current_user
      redirect_to books_path
     end
  end

  def update
  	@book = Book.find(params[:id])
  	 if @book.update(book_params)
  	 	flash[:notice] = "Book was successfully updated."
  	 	redirect_to book_path(@book)
  	 else
  	 	# @books = Book.all　edit画面では使わないからいらない
  	 	render :edit
  	 end
  end

  def destroy
  	book = Book.find(params[:id])
  		book.destroy
  		flash[:notice] = "Book was successfully destroyed."
  		redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
