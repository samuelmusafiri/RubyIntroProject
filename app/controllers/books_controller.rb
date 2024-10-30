class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  #New controller for book

  def show
    @book = Book.find(params[:id])
  end

  def search
    query = params[:query]
    @books = Book.where("title LIKE ?", "%#{query}%")
    render :index
  end

  # New action for displaying the form to create a new book
  def new
    @book = Book.new
  end

  # Create action for saving the new book to the database
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # Edit action for displaying the form to edit an existing book
  def edit
    @book = Book.find(params[:id])
  end

  # Update action for saving changes to the existing book
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Strong parameters to prevent mass assignment issues
  def book_params
    params.require(:book).permit(:title, :author)
  end
end


